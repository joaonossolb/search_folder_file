#! /bin/bash

ip=$1
porta=$2
arquivo=$3
#curl -s -o /dev/null -w%{http_code} 192.168.2.27:81
resposta_http=$(curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36 OPR/58.0.3135.107" -s -o /dev/null -w%{http_code} "$ip":"$porta")
if [ "$resposta_http" == "200" ] 
then
	echo "$ip:$porta [200]" >> "$arquivo"
fi

if [ "$resposta_http" == "301" ]
then
        echo "$ip:$porta [301]" >> "$arquivo"
fi
