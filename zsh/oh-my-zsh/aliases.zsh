# Custom oh-my-zsh aliases. Copy this file to ~/.oh-my-zsh/custom/aliases.zsh
# to make them automatically included

# Functions for Logitech Litra Glow streaming lights
# Requires hidapitester to be installed in /usr/local/bin
# Commands two standalone Logitech Litra Glow units in a single command
#
# Be sure to build latest version of hidapitester from the source since earlier versions do not support the --serial flag
# https://github.com/todbot/hidapitester#compiling
# 
# You can get the serial numbers for the devices with 'hidapitester --list-details'
function _hid() {
   /usr/local/bin/hidapitester --serial 2210FE1013K8 --open --length 20 --send-output $1
   /usr/local/bin/hidapitester --serial 2210FE1018H8 --open --length 20 --send-output $1
}

# 2/17/22 Litra Glow aliases with correct payloads from
# https://github.com/kharyam/litra-driver/issues/13
function litra_on() {
  _hid 0x11,0xff,0x04,0x1c,0x01
}

function litra_off() {
  _hid 0x11,0xff,0x04,0x1c
}

# ~10% brightness
function litra_10(){
  _hid 0x11,0xff,0x04,0x4c,0x00,20
}

# ~20% brightness
function litra_20(){
  _hid 0x11,0xff,0x04,0x4c,0x00,50
}

# tweaking by hand - less than 50%
function litra_30() {
  _hid 0x11,0xff,0x04,0x4c,0x00,70
}

# ~50% brightness
function litra_50() {
  _hid 0x11,0xff,0x04,0x4c,0x00,100
}

# 90% brightness
function litra_90(){
  _hid 0x11,0xff,0x04,0x4c,0x00,204
}

# 2700K warmth
function litra_warmest() {
  _hid 0x11,0xff,0x04,0x9c,10,140
}

# 3200K warmth
function litra_warm() {
  _hid 0x11,0xff,0x04,0x9c,12,128
}

# 6500K warmth
function litra_coldest() {
  _hid 0x11,0xff,0x04,0x9c,25,100
}
