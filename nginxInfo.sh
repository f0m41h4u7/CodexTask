#!/bin/bash

#getting nginx information
nginxinf=$(systemctl status nginx)

stat=$(echo $nginxinf | awk -F" " 'NR==3{print}' | cut -b 12-) #getting status of nginx server
proc=$(echo $nginxinf | awk -F" " 'NR==5{print}' | cut -b 12-) #getting name of running process

cat >> sysinfo.json <<EOF
        "NGINX Info:"
	{
		"Status": "$stat",
		"Process": "$proc",
		"Sites":
		[
EOF

#getting information about nginx sites on this server
sitesinf=$(ls /etc/nginx/sites-available/*.conf)

while read -r line; do
	name=$(echo $sitesinf  | egrep -o 'server_name .+' | awk -F" " '{print $2}')
	port=$(echo $sitesinf | egrep -o 'listen [0-9]+' | awk -F" " '{print $2}')
        cat >> sysinfo.json <<EOF
                	{       
                        	"Server Name": "$name",
                        	"Port": "$port",
                	},
EOF
done <<< "$sitesinf"

cat >> sysinfo.json <<EOF
		]
	}
EOF
