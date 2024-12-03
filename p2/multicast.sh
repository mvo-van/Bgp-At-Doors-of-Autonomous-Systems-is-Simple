# !/bin/bash
containers=$(docker ps --format "{{.Names}}")
for name in $containers
do
	hostname=$(docker inspect --format '{{.Config.Hostname}}' $name)
	docker exec -it $name sh -c "sh /opt/badass/p2/multicast/$hostname.sh"
done