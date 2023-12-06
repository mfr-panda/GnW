#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"

dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 1.7-menu-retro-go.sh Utilisateur = $usuario ------------------" \
--title "G&W menu emulateur Retro-Go" \
--ok-label Apply \
--cancel-label Exit \
--menu "Sélectionnez l'option souhaitée avec les flèches:" 12 120 15 \
   1 "Nouvelle installation de Retro-Go" \
   2 "Mettez à jour le répertoire local du dépôt Retro-Go en vous connectant à GitHub" \
   3 "Réinitialisez le répertoire du dépôt et téléchargez à partir de 0" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    cd /home/$usuario/gameandwatch
    if [ -d /home/$usuario/gameandwatch/game-and-watch-retro-go ]; then
        sudo rm -R /home/$usuario/gameandwatch/game-and-watch-retro-go
    fi
    #sleep 5
    git clone --recurse-submodules https://github.com/sylverb/game-and-watch-retro-go
    sleep 2
    #cd game-and-watch-retro-go
    #antiguo metodo usado para instalar los paquetes requeridos. A partir de ubuntu 23.04 no se puede usar este metodo
    #pip3 install -r requirements.txt
    clear;;
  2)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-retro-go ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        git pull --recurse-submodules
        read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    else
        echo "Répertoire du dépôt non détecté, impossible de continuer."
    fi
    clear;;
  3)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-retro-go ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        git reset --hard
        git pull --recurse-submodules
        read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    fi
    clear;;
esac
clear

