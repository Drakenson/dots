#!/bin/bash
hp=$(bash -c 'pactl list sinks | grep "Aktiver Port: analog-output-headphones-2"')
lo=$(bash -c 'pactl list sinks | grep "Aktiver Port: analog-output-lineout"')

if [ -z "$lo" ]
then
  pactl set-sink-port alsa_output.pci-0000_30_00.6.analog-stereo analog-output-lineout
elif [ -z "$hp" ]
then
  pactl set-sink-port alsa_output.pci-0000_30_00.6.analog-stereo analog-output-headphones-2
fi
