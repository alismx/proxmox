#!/bin/bash

IMAGEPATH="$1"
VMID=$(echo $((1 + $RANDOM % 999)))
VMNAME="${2:-vm$VMID}"
VMMEM=2048
VMCORES=2
AGENT=1

qm create $VMID --net0 virtio,bridge=vmbr0 --name $VMNAME --memor $VMMEM --cores $VMCORES --agent enabled=$AGENT --serial0 socket --boot order=scsi0 --scsihw virtio-scsi-pci --ostype l26 --scsi0 local:0,import-from=$IMAGEPATH
