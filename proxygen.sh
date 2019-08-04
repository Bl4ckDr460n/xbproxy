#!/bin/bash
# generator proxy.
hijau=$(tput setaf 2)
function generator(){
echo -e "INFO : grab from -> free-proxy-list.net"
curl --silent "https://free-proxy-list.net/" | grep -Eo '<td>([0-9]{1,3}\.){3}[0-9]{1,3}<(.?*)>[0-9]{2,9}</td>' | sed 's/<td>//g' | sed 's/<\/td>/:/g' | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{2,9}' >> PROXY.txt
echo -e "INFO : grab from -> sslproxies.org"
curl --silent "https://www.sslproxies.org/" | grep -Eo '<td>([0-9]{1,3}\.){3}[0-9]{1,3}<(.?*)>[0-9]{2,9}</td>' | sed 's/<td>//g' | sed 's/<\/td>/:/g' | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{2,9}' >> PROXY.txt
echo -e "INFO : grab from -> free-proxy-list.net/uk-proxy.html"
curl --silent "https://free-proxy-list.net/uk-proxy.html" | grep -Eo '<td>([0-9]{1,3}\.){3}[0-9]{1,3}<(.?*)>[0-9]{2,9}</td>' | sed 's/<td>//g' | sed 's/<\/td>/:/g' | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{2,9}' >> PROXY.txt    
echo -e "INFO : grab from -> socks-proxy.net"
curl --silent "https://www.socks-proxy.net/" | grep -Eo '<td>([0-9]{1,3}\.){3}[0-9]{1,3}<(.?*)>[0-9]{2,9}</td>' | sed 's/<td>//g' | sed 's/<\/td>/:/g' | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{2,9}' >> PROXY.txt
echo -e "INFO : grab from -> free-proxy-list.net/anonymous-proxy.html"
curl --silent "https://free-proxy-list.net/anonymous-proxy.html" | grep -Eo '<td>([0-9]{1,3}\.){3}[0-9]{1,3}<(.?*)>[0-9]{2,9}</td>' | sed 's/<td>//g' | sed 's/<\/td>/:/g' | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{2,9}' >> PROXY.txt
echo -e "INFO : grab from -> www.proxy-list.download"
curl --silent "https://www.proxy-list.download/api/v1/get?type=http&country=US" >> PROXY.txt
echo -e "INFO : grab from -> squidproxyserver.com"
curl --silent "https://squidproxyserver.com/" | grep -Eo '<td>([0-9]{1,3}\.){3}[0-9]{1,3}<(.?*)>[0-9]{2,9}</td>' | sed 's/<td>//g' | sed 's/<\/td>/:/g' | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{2,9}' >> PROXY.txt
echo -e "INFO : grab from -> hidemyassproxylist.org"
curl --silent "http://www.hidemyassproxylist.org/" | sed 's/<\/td><\/tr><tr><td>/\\\n/g' | grep -Eo '<td>([0-9]{1,3}\.){3}[0-9]{1,3}<(.?*)>[0-9]{2,9}</td>' | sed 's/<td>//g' | sed 's/<\/td>/:/g' | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{2,9}' >> PROXY.txt
echo -e "INFO : grab from -> us-proxy.org"
curl --silent "https://www.us-proxy.org/" | grep -Po '<td>(.*)</td>' | sed 's/<td>//g' | sed 's/<\/td>/:/g' | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{5,9}' >> PROXY.txt
echo -e "$hijau[+] TOTAL -> " $(wc -l PROXY.txt)
}
echo "[ -- BY WIDHI SEC -- ]"
generator