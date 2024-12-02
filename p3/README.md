# Explications

* On a notre premier système autonome (AS).
* Notre route reflector (spine / RR) permet de faire communiquer les différents routeurs (leafs / VTEP) entre eux ainsi que de communiquer vers l'extérieur, grâce au protocole BGP.
* L'ensemble des routeurs et des machines sont alors présentes dans un même VXLAN (id: 10) et peuvent communiquer entre eux comme s'ils étaient branchés sur un même routeur.
* L'avantage du RR est de centraliser les différents routeurs en un seul point, permettant une extensibilité et une simplicité de l'architecture.

# Mise en place

* Route Reflector :
 - Connecter en Ethernet aux différents routeurs.
 - Utilisation du protocole MP-BGP pour la communication avec les routeurs.
 - Utilisation du protocole OSPF pour informer des différentes routes disponibles.

* Routeurs :
 - Connecter au RR et informer les autres routeurs de son existence avec le protocole OSPF.
 - Connexion en bridge à la machine hôte et inscription au VXLAN 10.

* Hôtes :
 - Indiquer une adresse IP.

# Avant d'utiliser les images sur gns3

`./p3/run.sh`

# Vérification de l'exercice

* Se connecter à une machine hôte et vérifier qu'on peut ping les autres. (ex : `ping 30.1.1.1`)
* Se connecter à un routeur et executer :
    `vtysh`
    `conf t`
    `router bgp 1`
    `do sh ip route`
 Vérifier alors que les ip des routeurs soient toutes présentes et que le protocole utilisé pour les découvrir est OSPF.

* Aussi, `do sh bgp l2vpn evpn` permet de vérifier que les machines hôtes soient connectées en EVPN, ainsi que les différents chemins pour y accéder.