#!/usr/bin/env nu

def wait [] {
  ["continue"] | input list
}

def auto_detect_target [] {
  let os = (sys host | get name)

  if $os == "Darwin" {
    "/Volumes/NICENANO/new.uf2"
  } else {
    let device = (udisksctl status | from ssv | drop nth 0 | where MODEL =~ Adafruit | update DEVICE { $"/dev/($in)" } | get DEVICE.0)
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

def main [
  token: string
  --repo: string = "surma/choc",
  --target: string
  --zip-file: string
  --left
  --right
] {
  let zip: string = $zip_file | default -e $"($env.HOME)/Downloads/firmware.zip"

  let flash_left = $left or (not $left and not $right)
  let flash_right = $right or (not $left and not $right)

  print $"Downloading latest firmware to ($zip)..."
  let headers = ["Authorization" $"Bearer ($token)"]
  let artifactUrl = http get --headers $headers $"https://api.github.com/repos/($repo)/actions/artifacts" | get artifacts | sort-by -r created_at | get 0.archive_download_url
  http get --headers $headers $artifactUrl | save -f $zip
  print "Done."

  if $flash_left {
    print "Please connect the left board and put it into bootloader mode..."
    wait
    let left_target = (get_target_path $target)
    flash_firmware $zip "corne_left-nice_nano-zmk.uf2" $left_target
  }

  if $flash_right {
    print "Please connect the right board and put it into bootloader mode..."
    wait
    let right_target = (get_target_path $target)
    flash_firmware $zip "corne_right-nice_nano-zmk.uf2" $right_target
  }
}
