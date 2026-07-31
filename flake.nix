{
  description = "Offline ZMK firmware build for SurmToucan";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-25.11";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = f:
        builtins.listToAttrs (map (system: {
          name = system;
          value = f system;
        }) systems);

      pythonPackages = ps:
        with ps; [
          anytree
          # `canopen` is not needed for this ZMK/Zephyr firmware build and is
          # currently flaky to build on Darwin in pinned nixpkgs because its
          # upstream test suite intermittently fails. Excluding it keeps the
          # toolchain reproducible instead of depending on an unrelated test.
          intelhex
          jsonschema
          packaging
          patool
          progress
          protobuf
          psutil
          pyelftools
          pykwalify
          pyserial
          pyyaml
          remarshal
          requests
          semver
          tqdm
          west
        ];
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
          lib = pkgs.lib;

          zmkSources =
            map
              (source:
                source
                // {
                  src = builtins.fetchGit {
                    url = source.url;
                    rev = source.rev;
                    shallow = true;
                  };
                })
              (import ./nix/zmk-sources.nix);

          pythonEnv = pkgs.python3.withPackages pythonPackages;

          pinnedWorkspace = pkgs.runCommand "surm-toucan-zmk-workspace" { } ''
            set -euo pipefail
            mkdir -p "$out"
            ${lib.concatMapStrings (source: ''
              mkdir -p "$out/$(dirname "${source.path}")"
              cp -R ${source.src} "$out/${source.path}"
              chmod -R u+w "$out/${source.path}"
            '') zmkSources}
          '';

          firmwareVersion = "2026-03-17";

          buildTargets = [
            {
              board = "seeeduino_xiao_ble";
              shield = "toucan_left rgbled_adapter nice_view_gem";
              cmakeArgs = "-DSNIPPET=studio-rpc-usb-uart -DCONFIG_ZMK_STUDIO=y";
              artifactName = "toucan_left-seeeduino_xiao_ble-zmk";
            }
            {
              board = "seeeduino_xiao_ble";
              shield = "toucan_right rgbled_adapter";
              cmakeArgs = "";
              artifactName = "toucan_right-seeeduino_xiao_ble-zmk";
            }
          ];

          westManifestYaml =
            "manifest:\n  projects:\n"
            + lib.concatMapStrings (source:
              "    - name: ${source.name}\n"
              + "      path: ${source.path}\n"
              + "      url: ${source.url}\n"
              + "      revision: ${source.rev}\n"
              + lib.optionalString (source.path == "zephyr") "      west-commands: scripts/west-commands.yml\n"
            ) zmkSources;
        in
        rec {
          firmware = pkgs.stdenvNoCC.mkDerivation {
            pname = "surm-toucan-firmware";
            version = firmwareVersion;

            dontUnpack = true;
            dontConfigure = true;
            strictDeps = true;

            nativeBuildInputs = with pkgs; [
              cmake
              dtc
              file
              git
              gperf
              ninja
              pythonEnv
              protobuf
              unzip
              which
              zip
              gcc-arm-embedded
            ];

            buildPhase = ''
              set -euo pipefail

              export HOME="$TMPDIR/home"
              export XDG_CACHE_HOME="$TMPDIR/cache"
              export SOURCE_DATE_EPOCH=315532800
              export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb
              export GNUARMEMB_TOOLCHAIN_PATH=${pkgs.gcc-arm-embedded}
              export PYTHONPATH="${pythonEnv}/${pkgs.python3.sitePackages}''${PYTHONPATH:+:$PYTHONPATH}"
              export ZEPHYR_BASE="$TMPDIR/workspace/zephyr"

              mkdir -p "$HOME" "$XDG_CACHE_HOME"

              repoRoot="$TMPDIR/surm-toucan-module"
              baseDir="$TMPDIR/workspace"
              artifactsDir="$TMPDIR/artifacts"

              mkdir -p "$repoRoot" "$baseDir" "$artifactsDir" "$baseDir/.west" "$baseDir/manifest"

              cp -R ${pinnedWorkspace}/. "$baseDir/"
              chmod -R u+w "$baseDir"

              # ZMK v0.3's Nanopb imports pkg_resources unconditionally, but
              # uses it only with grpcio-tools. Current Setuptools removed the
              # unused module, and this build does not provide grpcio-tools.
              sed -i '/^import pkg_resources$/d' "$baseDir/modules/lib/nanopb/generator/proto/__init__.py"

              mkdir -p "$repoRoot/config" "$repoRoot/boards" "$repoRoot/zephyr"
              cp -R ${./config}/. "$repoRoot/config/"
              cp -R ${./boards}/. "$repoRoot/boards/"
              cp ${./zephyr/module.yml} "$repoRoot/zephyr/module.yml"
              cp ${./build.yaml} "$repoRoot/build.yaml"

              mkdir -p "$baseDir/config"
              cp -R "$repoRoot/config"/. "$baseDir/config/"
              chmod -R u+w "$baseDir/config"

              cat > "$baseDir/.west/config" <<'EOF'
[manifest]
path = manifest
file = west.yml

[zephyr]
base = zephyr
EOF

              cat > "$baseDir/manifest/west.yml" <<'EOF'
${westManifestYaml}
EOF

              pushd "$baseDir" >/dev/null
              west zephyr-export
              popd >/dev/null

              ${lib.concatMapStrings (target: ''
                buildDir="$TMPDIR/build-${target.artifactName}"
                rm -rf "$buildDir"
                mkdir -p "$buildDir"

                pushd "$baseDir" >/dev/null
                west build \
                  -d "$buildDir" \
                  -s zmk/app \
                  -b ${target.board} \
                  -- \
                  -DBUILD_VERSION=${firmwareVersion} \
                  -DZMK_CONFIG="$baseDir/config" \
                  -DZMK_EXTRA_MODULES="$repoRoot" \
                  -DSHIELD='${target.shield}' ${target.cmakeArgs}
                popd >/dev/null

                if [ -f "$buildDir/zephyr/zmk.uf2" ]; then
                  cp "$buildDir/zephyr/zmk.uf2" "$artifactsDir/${target.artifactName}.uf2"
                elif [ -f "$buildDir/zephyr/zmk.bin" ]; then
                  cp "$buildDir/zephyr/zmk.bin" "$artifactsDir/${target.artifactName}.bin"
                else
                  echo "Expected firmware artifact for ${target.shield}, but none was produced" >&2
                  exit 1
                fi
              '') buildTargets}
            '';

            installPhase = ''
              set -euo pipefail
              mkdir -p "$out"
              cp -R "$TMPDIR/artifacts"/. "$out/"

              # ZIP timestamps are only precise to DOS time and are a common
              # source of non-reproducibility. Normalize artifact mtimes before
              # archiving and strip extra metadata from the ZIP.
              find "$out" -type f \( -name '*.uf2' -o -name '*.bin' \) -exec touch -t 198001010000.00 {} +

              (
                cd "$out"
                if ls *.uf2 >/dev/null 2>&1; then
                  zip -X -q firmware.zip *.uf2
                else
                  zip -X -q firmware.zip *.bin
                fi
              )
            '';
          };

          default = firmware;
        });

      devShells = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.cmake
              pkgs.dtc
              pkgs.gcc-arm-embedded
              pkgs.gperf
              pkgs.git
              pkgs.ninja
              pkgs.python3
              pkgs.protobuf
              pkgs.unzip
              pkgs.which
              pkgs.zip
              (pkgs.python3.withPackages pythonPackages)
            ];

            shellHook = ''
              export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb
              export GNUARMEMB_TOOLCHAIN_PATH=${pkgs.gcc-arm-embedded}
            '';
          };
        });
    };
}
