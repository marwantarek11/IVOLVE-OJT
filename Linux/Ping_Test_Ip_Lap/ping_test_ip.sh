#!/bin/bash

subnet="192.168.1."

for i in {0..255}; do
    if ping -c 1 -W 1 "$subnet.$i" &>/dev/null; then
        echo "Server $subnet.$i is up and running"
    else
        echo "Server $subnet.$i is unreachable"
    fi
done
