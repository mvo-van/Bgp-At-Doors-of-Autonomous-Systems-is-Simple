router2:

____________RELIER NOTRE VXLAN ET ETH1_________________________________
ip link add br0 type bridge
ip link set dev br0 up
ip link add vxlan10 type vxlan id 10 dstport 4789
ip link set dev vxlan10 up
brctl addif br0 vxlan10
brctl addif br0 eth1
_______________________________________________________________________

no ipv6 forwarding
!
interface eth0                                      
    ip address 10.1.1.2/30
    ip ospf area 0                                  (connexion a l'air 0 de ospf)

interface lo
    ip address 1.1.1.2/32
    ip ospf area 0

router bgp 1
    neighbor 1.1.1.1 remote-as 1                    (appartient a l'AS1)
    neighbor 1.1.1.1 update-source lo               (envoi comme source l'adresse de lo)
    
    address-family l2vpn evpn
        neighbor 1.1.1.1 activate
        advertise-all-vni
    exit-address-family

router ospf


router 1 Route Reflector:

no ipv6 forwarding
!
interface eth0
    ip address 10.1.1.1/30
!
interface eth1
    ip address 10.1.1.5/30
!
interface eth2
    ip address 10.1.1.9/30
!
interface lo
    ip address 1.1.1.1/32
!

router bgp 1                                        (initialisation d'un systeme autonome (AS1))
    neighbor ibgp peer-group                        (nomage du peer-group 'ibgp')
    neighbor ibgp remote-as 1                       (configure une session BGP avec voisins appartenent au meme AS (le 1), donc ils font partie du meme reseau interne)
    neighbor ibgp update-source lo                   (specifie que le routeru doit utiliser l'adresse ip de son interface lo pour BGP de session ibgp, intependant des adresse physique)
    bgp listen range 1.1.1.0/29 peer-group ibgp     (ecoute des adresse ip dans la plage 1.1.1.0/29 et est ajouter au peer groupe ibgp)

    address-family l2vpn evpn                       (definition du passage par couche 2 (ethernet))?
        neighbor ibgp activate                      (activation des session BGP)
        neighbor ibgp route-reflector-client   (reflet des routes bgp vers les autres routeur, possibiliter de comunication indirect entre les routeur)
    exit-address-family

router ospf
    network 0.0.0.0/0 area 0                        (etablisement des voisin sur toute ses interface et contruction de LSDB)

line vty                                            (peu etre pas utile et remplasable par bash)


router 3:
ip link add br0 type bridge
ip link set dev br0 up
ip link add vxlan10 type vxlan id 10 dstport 4789
ip link set dev vxlan10 up
brctl addif br0 vxlan10
brctl addif br0 eth0

no ipv6 forwarding
!
interface eth1
    ip address 10.1.1.6/30
    ip ospf area 0
!
interface lo
    ip address 1.1.1.3/32
    ip ospf area 0
!
router bgp 1                
    neighbor 1.1.1.1 remote-as 1
    neighbor 1.1.1.1 update-source lo
    !
    address-family l2vpn evpn
        neighbor 1.1.1.1 activate
    exit-address-family
!
router ospf
!

router 4:

ip link add br0 type bridge
ip link set dev br0 up
ip link add vxlan10 type vxlan id 10 dstport 4789
ip link set dev vxlan10 up
brctl addif br0 vxlan10
brctl addif br0 eth0

no ipv6 forwarding
!
interface eth2
    ip address 10.1.1.10/30
    ip ospf area 0
!
interface lo
    ip address 1.1.1.4/32
    ip ospf area 0
!
router bgp 1
    neighbor 1.1.1.1 remote-as 1
    neighbor 1.1.1.1 update-source lo
    !
    address-family l2vpn evpn
        neighbor 1.1.1.1 activate
        advertise-all-vni
    exit-address-family
!
router ospf
!