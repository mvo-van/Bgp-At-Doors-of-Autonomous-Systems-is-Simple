* Se connecter sur chaque host et vérifier qu'on ne peut pas ping les machines entre elles
    * Lister les interfaces et montrer qu'aucune addresse IP n'est liée à l'interface eth1

Sur routeur 1 :
ip link add br0 type bridge
ip link set dev br0 up
ip addr add 10.1.1.1/24 dev eth0 (eth0 = interface vers switch)
(ip addr show eth0)
ip link add name vxlan10 type vxlan id 10 dev eth0 remote 10.1.1.2 local 10.1.1.1 dstport 4789
ip addr add 239.1.1.1/24 dev vxlan10
(ip -d link show vxlan10)
ip link set dev vxlan10 up
brctl addif br0 eth1 (eth1 = interface vers host)
brctl addif br0 vxlan10
(ip -d link show vxlan10)
(ip link show vxlan10)
(ip link show eth1)

Sur routeur 2 :
ip link add br0 type bridge
ip link set dev br0 up
ip addr add 10.1.1.2/24 dev eth0 (eth0 = interface vers switch)
ip link add name vxlan10 type vxlan id 10 dev eth0 remote 10.1.1.1 local 10.1.1.2 dstport 4789
ip addr add 239.1.1.2/24 dev vxlan10
ip link set dev vxlan10 up
brctl addif br0 eth1 (eth1 = interface vers host)
brctl addif br0 vxlan10

Sur Host 1 :
ip addr add 30.1.1.1/24 dev eth1 (ou eth0 si une interface)

Sur Host 2 :
ip addr add 30.1.1.2/14 dev eth1 (ou eth0 si une interface)
ping 30.1.1.1
