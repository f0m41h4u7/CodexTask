#!/bin/bash

disk_patritions=$(df -h | tail -n +2)

cat >> sysinfo.json <<EOF
        "Disk Info:"
        [
EOF

while read -r line; do
        filesystem=$(echo $line | awk '{print $1}')
	size=$(echo $line | awk '{print $2}')
        used=$(echo $line | awk '{print $3}')
	available=$(echo $line | awk '{print $4}')
        use=$(echo $line | awk -F" " '{print $5}')
	mounted=$(echo $line | awk -F" " '{print $6}')
        cat >> sysinfo.json <<EOF
                {       
                        "Filesystem": "$filesystem",
                        "Size": "$size",
			"Used": "$used",
			"Available": "$available",
			"Use%": "$use",
			"Mounted on": "$mounted"
                },
EOF
done <<< "$disk_patritions"

cat >> sysinfo.json <<EOF
        ],
EOF

