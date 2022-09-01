#!/bin/bash
sleep 5
amixer -c 1 sset 'Input Source',0 'Rear Mic'
#amixer -c 1 sset 'Input Source',1 'Line'
amixer -c 1 sset "Auto-Mute Mode" Disabled
#pw-link Alexa:capture_FL alsa_output.pci-0000_30_00.6.analog-stereo:playback_FL
#pw-link Alexa:capture_FR alsa_output.pci-0000_30_00.6.analog-stereo:playback_FR
