#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run with sudo or as root"
    exit 1
else
	now=$(date +"%Y%m%d_%H%M")
	snapper -c system create --description "$now"
	snapper -c home create --description "$now"
	snapper -c data create --description "$now"
	echo "Snapshots angelegt"
	echo ""
fi
