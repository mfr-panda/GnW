#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
consola="zelda"

clear
dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 1-menu-instalacion.sh Console sélectionnée = $consola ------------------" \
--title "Game & Watch - Menu Utilitaires de flash" \
--ok-label Apply \
--cancel-label Exit \
--menu "Sélectionnez l'option souhaitée avec les flèches:" 18 125 15 \
   1 "Préparation du système : mise à jour+mise à niveau+installation du package (obligatoire si ce n'est pas déjà fait)" \
   2 "Installation OpenOCD" \
   3 "Installation/Mise à jour du dépôt des outils de sauvegarde et de restauration" \
   4 "Installation/Mise à jour du dépôt du flashloader" \
   5 "Installation/Mise à jour du dépôt de l'émulateur Retro-Go" \
   6 "Installation/Mise à jour du dépôt de patchs de firmware Custom pour G&W Super Mario/Zelda" \
   7 "Installation/Mise à jour du dépôt Mame LCD Game Shrinker (LCD-Game-Shrinker)" \
   8 "Programme de mise à jour du micrologiciel STLINK v2" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    ./instalacion/1.3-preparacion-sistema.sh
    ./1-menu-instalacion.sh
    clear;;
  2)clear
    ./instalacion/1.4-openocd.sh
    ./1-menu-instalacion.sh
    clear;;
  3)clear
    ./instalacion/1.5-menu-backup-restore-tools.sh
    ./1-menu-instalacion.sh
    clear;;
  4)clear
    ./instalacion/1.6-menu-flashloader.sh
    ./1-menu-instalacion.sh
    clear;;
  5)clear
    ./instalacion/1.7-menu-retro-go.sh
    ./1-menu-instalacion.sh
    clear;;
  6)clear
    ./instalacion/1.8-menu-patch.sh
    ./1-menu-instalacion.sh
    clear;;
  7)clear
    ./instalacion/1.9-menu-LCD-Game-Shrinker.sh
    ./1-menu-instalacion.sh
    clear;;
  8)clear
    ./instalacion/1.11-actualizador-firmware.sh
    ./1-menu-instalacion.sh
    clear;;
esac
clear
