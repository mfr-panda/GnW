#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$

dialog --backtitle "G&W - Utilitaires de flash" \
--title "G&W menu de flash" \
--ok-label Apply \
--cancel-label Exit \
--menu "Sélectionnez l'option souhaitée avec les flèches:" 12 120 15 \
   1 "" \
   2 "" \
   3 "" \
   4 "" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    
    clear;;
  2)clear
    
    clear;;
  3)clear
    
    clear;;
  4)clear
    
    clear;;
esac
clear
