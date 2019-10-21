#!/bin/bash

#gettting ram information
memory=$(free -mht | grep Mem)

total=$(echo $memory | awk '{print $1}')
used=$(echo $memory | awk '{print $2}')
free=$(echo $memory | awk '{print $3}')
cat >> sysinfo.json <<EOF
        "Memory(RAM) Info:"
        {
		"Total": "$total",
		"Used": "$used",
		"Free": "$free"
	},
EOF


