#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"

dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 1.5-menu-backup-restore-tools.sh Utilisateur = $usuario ------------------" \
--title "G&W menu des outils de backup et de restauration" \
--ok-label Apply \
--cancel-label Exit \
--menu "Sélectionnez l'option souhaitée avec les flèches:" 12 120 15 \
   1 "Nouvelle installation des outils de sauvegarde et de restauration" \
   2 "Mise à jour du répertoire du dépôt" \
   3 "Réinitialisez le répertoire du dépôt et téléchargez à partir de 0" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    cd /home/$usuario/gameandwatch
    if [ -d /home/$usuario/gameandwatch/game-and-watch-backup ]; then
        sudo rm -R /home/$usuario/gameandwatch/game-and-watch-backup
    fi
    #sleep 5
    git clone https://github.com/ghidraninja/game-and-watch-backup.git
    sleep 2
    clear;;
  2)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-backup ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-backup
        git pull --recurse-submodules
        read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    else
        echo "Répertoire du dépôt non détecté, impossible de continuer."
    fi
    clear;;
  3)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-backup ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-backup
        git reset --hard
        git pull --recurse-submodules
        read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    fi
    clear;;
esac
clear

