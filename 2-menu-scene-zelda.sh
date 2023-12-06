#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"

dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2-menu-scene-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
--title "Game&Watch $consola - menu de flash" \
--ok-label Apply \
--cancel-label Exit \
--menu "
Utilisateur actuel: $usuario
Console sélectionnée: $consola

Sélectionnez l'option souhaitée avec les flèches:" 0 0 0 \
   1 "Backup, restauration et déblocage G&W $consola" \
   2 "Installation du Custom FirmWare (CFW) et RetroGo et sbackup/restauration des états de sauvegarde dans G&W $consola" \
   3 "Génération des Roms Game&Watch" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    ./scene/2.1-backup-restauracion.sh
    ./2-menu-scene-$consola.sh
    clear;;
  2)clear
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2-retro-go-$consola.sh
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2.1-solo-retro-go-$consola.sh
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-$consola.sh
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-$consola.sh
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-$consola.sh
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-$consola.sh
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-$consola.sh
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2.1-save-state-$consola.sh
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2.2-save-state-$consola.sh
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2.3-save-state-$consola.sh
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2.4-save-state-$consola.sh
    ./scene/2.2-retro-go-$consola.sh
    ./2-menu-scene-$consola.sh
    clear;;
  3)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "Génération des roms Game&Watch" \
    --yesno "Placez vos roms Game&Watch et vos illustrations que vous souhaitez générer\nIMPORTANT: Pour que le script fonctionne, vous devez prendre en compte les éléments suivants:\n-Les roms doivent provenir du romset 0.229 de Mame, au format Non-Merged et doivent être placées dans le répertoire\n/home/$usuario/gameandwatch/LCD-Game-Shrinker/input/rom\n-Les artworks doivent être copiées dans le répertoire /home/$usuario/gameandwatch/LCD-Game-Shrinker/input/artwork\n-Les deux fichiers (rom et artwork) doivent être au format zip et doivent avoir le même nom.\n\nNOTES : vous trouverez les roms converties dans home/$usuario/gameandwatch/LCD-Game-Shrinker/output" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        cd /home/$usuario/gameandwatch/LCD-Game-Shrinker/
        python3 shrink_it.py
        cd -
        read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    else
        echo "Processus annulé"
		read -n 1 -s -r -p "Processus effectué. Appuyez sur n'importe quelle touche pour continuer"
    fi
    ./2-menu-scene-$consola.sh
    clear;;
esac
clear
