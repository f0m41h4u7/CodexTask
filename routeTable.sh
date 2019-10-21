#!/bin/bash

#getting route table information
route_table=$(route -n | tail -n +3)

cat >> sysinfo.json <<EOF
	"Route Table Info:"
        [
EOF

while read -r line; do
        destination=$(echo $line | awk '{print $1}')
        gateway=$(echo $line | awk '{print $2}')
        genmask=$(echo $line | awk '{print $3}')
        flags=$(echo $line | awk '{print $4}')
        metric=$(echo $line | awk -F" " '{print $5}')
        ref=$(echo $line | awk -F" " '{print $6}')
	use=$(echo $line | awk -F" " '{print $7}')
	iface=$(echo $line | awk -F" " '{print $8}')
        cat >> sysinfo.json <<EOF
                {       
                        "Destination": "$destination",
                        "Gateway": "$gateway",
                        "Genmask": "$genmask",
                        "Flags": "$flags",
                        "Metric": "$metric",
                        "Ref": "$ref"
			"Use": "$use"
			"Iface": "$iface"
                },
EOF
done <<< "$route_table"

cat >> sysinfo.json <<EOF
        ],
EOF
