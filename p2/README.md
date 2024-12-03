* Dans notre réseau, nous avons :
    - un switch 
    - deux routeurs 
    - deux hosts
* Objectifs :
    - pouvoir comuniquer dans le resau via un dynamic multicast

* Exécution :
    - mise en place d'un réseau Ethernet.
    - mise en place de bridge entre les routeurs et leur host
    - configuration d'un VXLAN et connexion des routeurs au VXLAN

* Vérifications :
    - Executer le script unicast puis multicast
    - Se connecter à chaque host et vérifier que l'on peut pinger les machines entre elles.
    - Verification vxlan dans les routeurs : ip -d link show vxlan10