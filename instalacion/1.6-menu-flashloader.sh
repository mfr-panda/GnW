#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"

dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 1.6-menu-flashloader.sh Utilisateur = $usuario ------------------" \
--title "G&W menu flashloader" \
--ok-label Apply \
--cancel-label Exit \
--menu "Sélectionnez l'option souhaitée avec les flèches:" 12 120 15 \
   1 "Nouvelle installation du flashloader" \
   2 "Mise à jour du répertoire du dépôt" \
   3 "Réinitialisez le répertoire du dépôt et téléchargez à partir de 0" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    cd /home/$usuario/gameandwatch
    if [ -d /home/$usuario/gameandwatch/game-and-watch-flashloader ]; then
        sudo rm -R /home/$usuario/gameandwatch/game-and-watch-flashloader
    fi
    #sleep 5
    git clone https://github.com/ghidraninja/game-and-watch-flashloader.git
    sleep 2
    clear;;
  2)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-flashloader ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-flashloader
        git pull --recurse-submodules
        read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    else
        echo "Répertoire du dépôt non détecté, impossible de continuer."
    fi
    clear;;
  3)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-flashloader ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-flashloader
        git reset --hard
        git pull --recurse-submodules
        read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    fi
    clear;;
esac
clear

