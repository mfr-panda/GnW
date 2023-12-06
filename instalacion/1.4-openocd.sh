#!/bin/bash
#By julenvitoria

usuario="kde"

clear
#Descarga del sitio original y descomprime el .deb
wget https://nightly.link/kbeckmann/ubuntu-openocd-git-builder/workflows/docker/master/openocd-git.deb.zip
unzip openocd-git.deb.zip
sudo dpkg -i openocd-git_*_amd64.deb
sudo apt-get -y -f install
rm openocd*
#echo export OPENOCD=/opt/openocd-git/bin/openocd >>~/.bashrc
if grep -q "export OPENOCD=\"/opt/openocd-git/bin/openocd\"" /home/$usuario/.bashrc ; then
        echo "export OPENOCD=\"/opt/openocd-git/bin/openocd\" est déjà dans le bashrc"
else
        echo "export OPENOCD=\"/opt/openocd-git/bin/openocd\" n'est pas dans le bashrc, ajout..."
        sleep 2
        echo export OPENOCD=\"/opt/openocd-git/bin/openocd\" >>/home/$usuario/.bashrc
fi

export OPENOCD="/opt/openocd-git/bin/openocd"
sleep 3

dialog --backtitle "G&W ------------------------- INFO: 1.4-openocd.sh -------------------------- Utilisateur = $usuario ------------------------" \
       --title "INFO: Utilisateur=$usuario ---------- Installation openocd" \
       --yesno "¡¡¡ATTENTION!!! Il est recommandé d'effectuer un redémarrage après l'installation d'OPENOCD pour s'assurer que tout fonctionne correctement. Si vous ne le faites pas maintenant, pensez à le faire plus tard. Voulez-vous redémarrer le système?" 0 0
    ans=$?
if [ $ans -eq 0 ]; then
    clear
    dialog --backtitle "G&W ------------------------- INFO: 1.4-openocd.sh -------------------------- Utilisateur = $usuario ------------------------" \
           --title "INFO: Utilisateur=$usuario ---------- Installation openocd" \
           --infobox "Redémarrage du système..." 0 0 ; sleep 2
    sudo reboot
else
    dialog --backtitle "G&W ------------------------- INFO: 1.4-openocd.sh -------------------------- Utilisateur = $usuario ------------------------" \
           --title "INFO: Utilisateur=$usuario ---------- Installation openocd" \
           --infobox "N'oubliez pas de redémarrer plus tard :)" 0 0 ; sleep 2
fi
