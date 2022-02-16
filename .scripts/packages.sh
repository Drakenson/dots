#!/bin/bash
pacman -Qeq > /tmp/packages.txt
diff ~/Nextcloud/Notizen/Pakete/packages.txt /tmp/packages.txt
