vm=$1
if [ -z "$vm" ]; then
	echo "Hinweis: Bitte VM-Namen angeben."
	echo "bootvm.sh <VM-Name>"
	exit 1
fi
virsh -c qemu:///system start $vm
echo "VM $vm gestartet."
