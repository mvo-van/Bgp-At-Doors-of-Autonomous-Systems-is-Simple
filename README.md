# Bgp-At-Doors-of-Autonomous-Systems-is-Simple

# Setup du projet
1. Telecharger le .ova sur "https://www.gns3.com/software/download-vm"
2. Importer le .ova dans virtualbox et creer la VM
3. Rajouter l'interface "vboxnet3"
4. Executer `VBoxManage list vms` pour recuperer l'ID de la VM
5. Executer `vagrant package --base <VM_ID> --output GNS3.box` (sur la machine de l'ecole, le faire dans goinfre sinon erreur d'espace)
6. Executer `vagrant box add GNS3.box --name GNS3` pour creer la box vagrant
7. Executer `vagrant up` et attendre le démarrage complet de la VM
7. Executer `vagrant ssh`
8. Executer `cd /opt/badass && sh docker.sh`