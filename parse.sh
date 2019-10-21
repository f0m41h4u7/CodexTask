#!/bin/bash

server_address=$1

characteristics=("./ram.sh" "./diskInfo.sh" "./routeTable.sh" "./servicesInfo.sh" "./containers.sh" "./images.sh" "./nginxInfo.sh")
n=7

cat > sysinfo.json <<EOF
{
        "Hostname": "$(hostname)",
	"CPU Usage": $(./cpu.sh),
EOF

for ((i=0; i<n; i++)) 
do
	`${characteristics[$i]}`
done

cat >> sysinfo.json <<EOF
}
EOF

curl -X POST -d @'sysinfo.json' -H "Content-Type: application/json" $server_address -v
