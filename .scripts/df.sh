#!/bin/bash
df -hl | grep -v 'nvme0n1\|nvme1n1\|sda'
df -h | grep nvme1n1 | tail -n 2
df -h | grep nvme0n1 | tail -n 1
df -h | grep sda | tail -n 1
