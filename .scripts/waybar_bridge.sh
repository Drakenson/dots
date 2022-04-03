#!/bin/bash
nw=$(bash -c 'nmcli | grep "enp7s0: nicht verbunden"')
if [ -z "$nw" ]
then
	nmcli connection down it.drakenson.de
	nmcli connection up iPhone
else
	nmcli connection down iPhone
	nmcli connection up it.drakenson.de
fi
