#!/bin/bash

# Check if the VM is running
vm_status=$(vagrant status web --machine-readable | grep ",state," | cut -d',' -f4)

if [ "$vm_status" != "running" ]; then
  echo "VM is down. Restarting..."
  vagrant up web
else
  echo "VM is running."
fi
