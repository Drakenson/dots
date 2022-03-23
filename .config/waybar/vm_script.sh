#!/bin/bash
vms=$(virsh -c qemu:///system list --all --name)
for vm in $vms
do
	state=$(virsh -c qemu:///system domstate $vm)
	if [ "$state" != "ausgeschaltet" ]; then
		echo -n "$vm "
	fi
done
