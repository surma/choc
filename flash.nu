#!/usr/bin/env nu

def wait [] {
  ["continue"] | input list
}

def auto_detect_target [] {
  let os = (sys host | get name)

  if $os == "Darwin" {
    "/Volumes/XIAO-BOOT/new.uf2"
  } else {
    let bootloader_models = ["XIAO nRF52840" "Adafruit nRF UF2"]
    let device = (udisksctl status | from ssv | drop nth 0 | where {|drive| $drive.MODEL in $bootloader_models } | update DEVICE { $"/dev/($in)" } | get DEVICE.0)
    # UF2 bootloaders reboot as soon as every firmware block arrives. Keep
    # Linux from retaining unwritten firmware blocks in its page cache.
    let mount_point = (udisksctl mount -b $device -o sync | split row " " | last)
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
    let extract = (do { unzip -p $zip $firmware_file } | complete)
    if $extract.exit_code != 0 {
      error make { msg: ($extract.stderr | str trim) }
    }

    let firmware = $extract.stdout
    let firmware_size = ($firmware | bytes length)

    if $firmware_size mod 512 != 0 {
      error make { msg: $"Invalid UF2 size: ($firmware_size) bytes" }
    }

    # Write one complete UF2 block at a time and wait for each write to reach
    # the device. This prevents a reboot from stranding blocks in page cache.
    let result = (with-env { LC_ALL: "C" } {
      do {
        $firmware
        | dd $"of=($target_path)" bs=512 iflag=fullblock oflag=sync status=none
      } | complete
    })

    if $result.exit_code == 0 {
      print "Done."
    } else {
      # A successful UF2 flash removes the virtual drive immediately, which can
      # make the final FAT metadata write return an I/O error.
      sleep 500ms
      if ($target_path | path exists) {
        error make { msg: ($result.stderr | str trim) }
      }

      print "Done (bootloader rebooted)."
    }
  } catch {|err|
    error make { msg: $"Flashing failed: ($err.msg)" }
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

def get_local_firmware_zip [] {
  let packaged_output = ($env | get -o FLASH_FIRMWARE_OUTPUT)
  let output_path = if ($packaged_output | is-empty) {
    print "Building firmware locally with Nix..."
    nix build .#firmware --no-link --print-out-paths | str trim
  } else {
    $packaged_output
  }

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

      get_local_firmware_zip
    }
    _ => {
      error make { msg: $"unknown mode '($mode)'; expected 'download' or 'local'" }
    }
  }

  flash_requested_sides $zip $left $right $target
}
