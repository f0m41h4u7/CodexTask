#!/bin/bash

containers=$(docker ps -a | tail -n +2)

cat >> sysinfo.json <<EOF
        "Docker Containers:"
        [
EOF

#finding the number of containers
number_of_containers=$(echo "$containers" | wc -l)

while read -r line; do
        id=$(echo $line | awk -F" " '{print $1}')
        image=$(echo $line | awk -F" " '{print $2}')
        action=$(echo $line | egrep -o '[/"][a-zA-Z0-9 /./,]+[/"]')
        created=$(echo $line | awk '{print $5 " " $6 " " $7}')
        stat=$(echo $line | awk -F" " '{print $8}')
        ports=$(echo $line | awk -F" " '{print $13}' | egrep -o '[0-9\.\: ]')
        name=$(echo $line | awk -F" " '{print $NF}')
        cat >> sysinfo.json <<EOF
                {       
                        "Comtainer ID": "$id",
                        "Image": "$image",
                        "Command": $action,
                        "Created": "$created",
                        "Status": "$stat",
                        "Ports": "$ports",
                        "Name": "$name"
EOF
	if ["$number" -eq "1" ]; then
               cat >> sysinfo.json <<EOF
                }
EOF
	else
		cat >> sysinfo.json <<EOF
                },
EOF	
        fi            
number_of_containers=$((number_of_containers+1))
done <<< "$containers"

cat >> sysinfo.json <<EOF
        ],
EOF
