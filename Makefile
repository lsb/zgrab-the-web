all:
	make domainlist
	make handshakes

domainlist:
	./01-get-index-paths.sh | ./02-index-paths-to-fqdns.sh | split -l 10000000 -d - $(date -I).fqdn.
	parallel gzip -9 ::: *.fqdn.*

handshakes:
	docker build -t zgrab -f zgrab.Dockerfile .
	parallel -j1 'zcat {} | docker run --rm --log-driver=none -v $PWD:$PWD -e DATADIR=$PWD -i zgrab ./zgrab -port 443 -lookup-domain -tls 2> /dev/null | gzip > {= s:fqdn:ssl:; =}' ::: *.fqdn.*
