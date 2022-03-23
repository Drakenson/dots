vm=$1
if [ -z "$vm" ]; then
	echo "Hinweis: Bitte VM-Namen angeben."
	echo "bootvm.sh <VM-Name> [<disable_cpu>]"
	exit 1
fi
disable_cpu=$2
nocore=0
if [ -n "$disable_cpu" ]; then
	sudo systemctl set-property --runtime -- user.slice AllowedCPUs=3
	sudo systemctl set-property --runtime -- system.slice AllowedCPUs=3
	sudo systemctl set-property --runtime -- init.scope AllowedCPUs=3
	nocore=1
	echo "Kerne deaktiviert."
else
	echo "Kerne nicht deaktiviert."
fi
virsh -c qemu:///system start $vm
echo "VM $vm gestartet."
echo "Steuerung: [p] zum Herunterfahren. [a] zum Abschalten der Kerne,"
echo "Steuerung: [e] zum Einschalten der Kerne, [s] für den aktuellen Status," 
echo "Steuerung: [b] zum Booten falls die VM aus ist."
while [ "$input_code" != "p" ]; do
	input_code=""
	read -p "--> "
    input_code=${REPLY}
	case "$input_code" in
		"a")
	    	sudo systemctl set-property --runtime -- user.slice AllowedCPUs=3
		    sudo systemctl set-property --runtime -- system.slice AllowedCPUs=3
		    sudo systemctl set-property --runtime -- init.scope AllowedCPUs=3
			nocore=1
		;;
		"e")
		    sudo systemctl set-property --runtime -- user.slice AllowedCPUs=0-3
		    sudo systemctl set-property --runtime -- system.slice AllowedCPUs=0-3
		    sudo systemctl set-property --runtime -- init.scope AllowedCPUs=0-3
			nocore=0
		;;
		"s")
			status=$(virsh -c qemu:///system domstate $vm)
			echo "Aktueller Status ist: $status"
		;;
		"b")
			virsh -c qemu:///system start $vm
		;;
	esac
done
state=$(virsh -c qemu:///system domstate $vm)
if [ "$state" != "ausgeschaltet" ]; then
	virsh -c qemu:///system shutdown $vm
	echo ""
fi
while [ "$state" != "ausgeschaltet" ]; do
    echo "Wird heruntergefahren.."
    state=$(virsh -c qemu:///system domstate $vm)
    sleep 1
done
if [ $nocore -eq 1 ]; then
	sudo systemctl set-property --runtime -- user.slice AllowedCPUs=0-3
	sudo systemctl set-property --runtime -- system.slice AllowedCPUs=0-3
	sudo systemctl set-property --runtime -- init.scope AllowedCPUs=0-3
fi
