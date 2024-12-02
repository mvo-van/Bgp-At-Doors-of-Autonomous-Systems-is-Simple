# Notes


# Explications

* on a une VM contenant gns3 ainsi que docker et les images docker associées au routeur + host
* Se connecter via SSH sur la VM ou depuis vbox
* on active les daemons qui nous intéressent via le fichier de configuration `frr.conf`
    * bgpd
    * osfpd
    * isisd
    * zebra
* on utilise frrouting car zebra et quagga ne sont plus maintenus et ils intègrent de base les daemons utiles comme bgp, isis, ...

# Avant d'utiliser les images sur gns3

`docker build -f routeur.Dockerfile . -t routeur_frrouting:latest`
`docker build -f host.Dockerfile . -t host_busybox:latest`


# Vérification de l'exercice

* Pour vérifier que les daemons sont bien lancés : `docker exec <container_name> ps`
    * Devrait apparaitre les daemons suivants :
        * [ ] isisd 
        * [ ] zebra
        * [ ] bgpd
        * [ ] osfpd

* Se rendre sur l'interface de GNS3 et ouvrir une console web sur les deux appareils :
    * On doit avoir accès aux deux appareils :
        * [ ] host_bbellavi-1 - ouvre un shell bash
        * [ ] routeur_bbellavi - ouvre une console avec le daemon frrouting en foreground qui affiche les daemons actifs
