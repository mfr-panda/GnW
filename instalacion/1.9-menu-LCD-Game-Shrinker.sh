#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"

dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 1.9-menu-LCD-Game-Shrinker.sh Utilisateur = $usuario ------------------" \
--title "G&W Menu LCD-shrink pour Mame (LCD-Game-Shrinker)" \
--ok-label Apply \
--cancel-label Exit \
--menu "Sélectionnez l'option souhaitée avec les flèches:" 12 120 15 \
   1 "Nouvelle installation de LCD-shrink pour Mame (LCD-Game-Shrinker)" \
   2 "Mise à jour du répertoire de dépôt" \
   3 "Réinitialisez le répertoire du dépôt et téléchargez à partir de 0" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    cd /home/$usuario/gameandwatch
    if [ -d /home/$usuario/gameandwatch/LCD-Game-Shrinker ]; then
        sudo rm -R /home/$usuario/gameandwatch/LCD-Game-Shrinker
    fi
    #sleep 5
    git clone https://github.com/bzhxx/LCD-Game-Shrinker
    sleep 2
    sudo apt update
    sudo apt install -y snapd libopenjp2-7 libtiff5 libxslt-dev libatlas-base-dev inkscape
    sudo snap install core
    #sudo snap install inkscape
    cd /home/$usuario/gameandwatch/LCD-Game-Shrinker
    #antiguo metodo usado para instalar los paquetes requeridos. A partir de ubuntu 23.04 no se puede usar este metodo
    #pip3 install -r requirements.txt
    clear;;
  2)clear
    if [ -d /home/$usuario/gameandwatch/LCD-Game-Shrinker ]; then
        cd /home/$usuario/gameandwatch/LCD-Game-Shrinker
        git pull --recurse-submodules
        read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    else
        echo "Répertoire du dépôt non détecté, impossible de continuer."
    fi
    clear;;
  3)clear
    if [ -d /home/$usuario/gameandwatch/LCD-Game-Shrinker ]; then
        cd /home/$usuario/gameandwatch/LCD-Game-Shrinker
        git reset --hard
        git pull --recurse-submodules
        read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    fi
    clear;;
esac
clear
