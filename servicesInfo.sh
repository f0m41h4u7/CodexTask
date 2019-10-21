#!/bin/bash

#getting information about running services
processes=$(systemctl list-units | grep running| sort)

cat >> sysinfo.json <<EOF
	"Running Services:"
	[
EOF

while read -r line; do
        name=$(echo $line | awk '{print $1}')
        state=$(echo $line | awk '{print $2}')
	name+=","
        state+=$(echo $line | awk -F" " '{print $3}')
	state+=", " 
	state+=$(echo $line | awk -F" " '{print $4}')
        cat >> sysinfo.json <<EOF
        	{       
                	"unit": "$name",
	                "status": "$state"
        	},
EOF
done <<< "$processes"

cat >> sysinfo.json <<EOF
	],
EOF
