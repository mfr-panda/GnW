#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"

dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 1.8-menu-patch.sh Utilisateur = $usuario ------------------" \
--title "G&W menu patch custom firmware pour G&W" \
--ok-label Apply \
--cancel-label Exit \
--menu "Sélectionnez l'option souhaitée avec les flèches:" 12 120 15 \
   1 "Nouvelle installation du patch custom firmware" \
   2 "Mise à jour du répertoire de dépôt" \
   3 "Réinitialisez le répertoire du dépôt et téléchargez à partir de 0" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    source py/bin/activate
    cd /home/$usuario/gameandwatch
    if [ -d /home/$usuario/gameandwatch/game-and-watch-patch ]; then
        sudo rm -R /home/$usuario/gameandwatch/game-and-watch-patch
    fi
    #sleep 5
    git clone https://github.com/BrianPugh/game-and-watch-patch
    sleep 2
    cd game-and-watch-patch
    #antiguo metodo usado para instalar los paquetes requeridos. A partir de ubuntu 23.04 no se puede usar este metodo
    #pip3 install -r requirements.txt
    make download_sdk
    deactivate
    clear;;
  2)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-patch ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-patch
        git pull --recurse-submodules
        read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    else
        echo "Répertoire du dépôt non détecté, impossible de continuer."
    fi
    clear;;
  3)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-patch ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-patch
        git reset --hard
        git pull --recurse-submodules
        read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    fi
    clear;;
esac
clear

