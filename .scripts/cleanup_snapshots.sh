#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run with sudo or as root"
    exit 1
else

	sudo snapper -c system cleanup number
	sudo snapper -c system cleanup timeline
	sudo snapper -c home cleanup number
	sudo snapper -c home cleanup timeline
	sudo snapper -c data cleanup number
	sudo snapper -c data cleanup timeline
	echo "Snapshots aufgeräumt"
	echo ""
fi
