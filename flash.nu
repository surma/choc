#!/usr/bin/env nu

def main [
  token: string
  repo: string = "surma/choc",
  zip: string = "~/Downloads/firmware.zip"
] {
  print "Downloading latest firmware..."
  let headers = ["Authorization" $"Bearer (token)"]
  let artifactUrl = http get --headers $headers $"https://api.github.com/repos/($repo)/actions/artifacts" | get artifacts | sort-by -r created_at | get 0.archive_download_url
  http get --headers $headers $artifactUrl | save -f $zip
  print "Done."

  print "Please connect the left board and put it into bootloader mode. Press any key..."
  input listen
  print "Flashing..."
  try {
    unzip -p $zip corne_left-nice_nano_v2-zmk.uf2 | save /Volumes/NICENANO/new.uf2
    print "Done."
  }
  print "Please connect the right board and put it into bootloader mode. Press any key..."
  input listen
  print "Flashing..."
  try {
    unzip -p $zip corne_right-nice_nano_v2-zmk.uf2 | save /Volumes/NICENANO/new.uf2
    print "Done."
  }
}
