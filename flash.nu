#!/usr/bin/env nu

def main [
  zip: string
] {
  print "Please connect the left board and put it into bootloader mode. Press any key..."
  input listen
  unzip -p $zip corne_right-nice_nano_v2-zmk.uf2 | save /Volumes/NICENANO/new.uf2
  print "Please connect the right board and put it into bootloader mode. Press any key..."
  input listen
  unzip -p $zip corne_left-nice_nano_v2-zmk.uf2 | save /Volumes/NICENANO/new.uf2
}
