#!/usr/bin/env nu

def wait [] {
  ["continue"] | input list
}

def auto_detect_target [] {
  let os = (sys host | get name)

  if $os == "Darwin" {
    "/Volumes/XIAO-BOOT/new.uf2"
  } else {
    let device = (udisksctl status | from ssv | drop nth 0 | where MODEL =~ "XIAO nRF52840" | update DEVICE { $"/dev/($in)" } | get DEVICE.0)
    let mount_point = (udisksctl mount -b $device | split row " " | last)
    $"($mount_point)/new.uf2"
  }
}

def get_target_path [target?: string] {
  if ($target | is-empty) {
    auto_detect_target
  } else {
    $target
  }
}

def flash_firmware [zip: string, firmware_file: string, target_path: string] {
  print "Flashing..."
  try {
    unzip -p $zip $firmware_file | save -rp $target_path
    print "Done."
  } catch {|err|
    print $"Something went wrong: ($err.msg)"
  }
}

def flash_requested_sides [zip: string, left: bool, right: bool, target?: string] {
  let flash_left = $left or (not $left and not $right)
  let flash_right = $right or (not $left and not $right)

  if $flash_left {
    print "Please connect the left board and put it into bootloader mode..."
    wait
    let left_target = (get_target_path $target)
    flash_firmware $zip "toucan_left-seeeduino_xiao_ble-zmk.uf2" $left_target
  }

  if $flash_right {
    print "Please connect the right board and put it into bootloader mode..."
    wait
    let right_target = (get_target_path $target)
    flash_firmware $zip "toucan_right-seeeduino_xiao_ble-zmk.uf2" $right_target
  }
}

def github_api_base [] {
  $env | get -o FLASH_GITHUB_API_BASE | default "https://api.github.com"
}

def download_firmware_zip [token: string, repo: string, zip_file?: string] {
  let zip: string = $zip_file | default -e $"($env.HOME)/Downloads/firmware.zip"
  let api_base = (github_api_base)

  print $"Downloading latest firmware to ($zip)..."
  let headers = ["Authorization" $"Bearer ($token)"]
  let artifact_url = http get --headers $headers $"($api_base)/repos/($repo)/actions/artifacts" | get artifacts | sort-by -r created_at | get 0.archive_download_url
  http get --headers $headers $artifact_url | save -f $zip
  print "Done."

  $zip
}

def build_local_firmware_zip [] {
  print "Building firmware locally with Nix..."
  let output_path = (nix build .#firmware --no-link --print-out-paths | str trim)
  let zip = $"($output_path)/firmware.zip"
  print $"Using local firmware from ($zip)."

  $zip
}

def main [
  mode: string
  token?: string
  --repo: string = "surma/choc"
  --target: string
  --zip-file: string
  --left
  --right
] {
  let zip = match $mode {
    "download" => {
      if ($token | is-empty) {
        error make { msg: "download mode requires a GitHub token" }
      }

      download_firmware_zip $token $repo $zip_file
    }
    "local" => {
      if not ($token | is-empty) {
        error make { msg: "local mode does not accept a GitHub token" }
      }

      if not ($zip_file | is-empty) {
        error make { msg: "--zip-file is only supported in download mode" }
      }

      build_local_firmware_zip
    }
    _ => {
      error make { msg: $"unknown mode '($mode)'; expected 'download' or 'local'" }
    }
  }

  flash_requested_sides $zip $left $right $target
}
