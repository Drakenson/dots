#!/bin/bash
vms=$(virsh -c qemu:///system list --all --name)
vm_list=""
check=1
for vm in $vms
do
	state=$(virsh -c qemu:///system domstate $vm)
	if [ "$state" != "ausgeschaltet" ]; then
		check=0
		vm_list+="$vm "
	fi
done

if [ $check -eq 0 ]; then
	swaynag -c ~/.config/waybar/nag.conf -t green -m "Folgende VMs laufen noch: $vm_list- Versuchen diese zu beenden?" -Z 'Ja!' '$HOME/.scripts/waybar_poweroff_vms.sh'
else
	case $1 in
		"poweroff")
			swaynag -c ~/.config/waybar/nag.conf -t brown -m 'System herunterfahren?' -Z 'Herunterfahren' 'systemctl poweroff'
		;;
		"suspend")
			swaynag -c ~/.config/waybar/nag.conf -t brown -m 'System in Standby versetzen?' -Z 'Standby' 'systemctl suspend'
		;;
		"reboot")
			swaynag -c ~/.config/waybar/nag.conf -t brown -m 'System neustarten?' -Z 'Neustarten' 'systemctl reboot'
		;;
	esac
fi
