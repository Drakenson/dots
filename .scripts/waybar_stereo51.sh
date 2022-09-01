#!/bin/bash
dolby=$(bash -c 'pactl list cards | grep "Active Profile: output:hdmi-surround"')
stereo=$(bash -c 'pactl list cards | grep "Active Profile: output:hdmi-stereo"')

if [ -z "$dolby" ]
then
  pactl set-card-profile alsa_card.pci-0000_30_00.1 output:hdmi-surround
elif [ -z "$stereo" ]
then
  pactl set-card-profile alsa_card.pci-0000_30_00.1 output:hdmi-stereo
fi
