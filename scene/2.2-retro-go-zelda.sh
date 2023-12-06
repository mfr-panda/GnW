#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"
proc="4"
caratula="0"

dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2-retro-go-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
--title "G&W $consola menu Retro-Go + custom firmware CFW" \
--msgbox "Le processus de flashage peut être effectué de différentes manières, choisissez celle qui convient le mieux à votre matériel. Si la puce mémoire a été modifiée, vous devriez avoir restauré le firmware d'origine dans l'option 5 du menu. \"scene>backup, restauration et déblocage de la console\". REMARQUE : Il est recommandé d'effectuer le processus avec la batterie chargée à 100 % pour éviter les frayeurs.." 0 0
dialog --backtitle "G&W $consola - Utilitaires de flash ------- INFO: 2.2-retro-go-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola    ////    Option jaquettes=$caratula (0=NO y 1=YES) -------" \
--title "G&W $consola CFW + Retro-Go /// INFO: Utilisateur=$usuario --- Console sélectionnée=$consola --- Roms en /home/$usuario/game-and-watch-retro-go/roms/" \
--ok-label Apply \
--cancel-label Exit \
--menu "
Utilisateur actuel: $usuario
Console sélectionnée: $consola
Option jaquettes: $caratula (0=NO y 1=YES)

Sélectionnez l'option souhaitée avec les flèches:" 0 0 0 \
   C "Option flash avec jaquettes. Actuellement:$caratula (0=NO y 1=YES)" \
   1 "4MB, 16MB et 64MB sans CFW: Menu flash uniquement Retro-Go + backup/restauration save states de la console G&W $consola" \
   2 "4MB: Menu CFW + Retro-Go + backup/restauration save states de la console G&W $consola originale" \
   3 "16MB: Menu CFW + Retro-Go + backup/restauration save states de la console G&W $consola" \
   4 "64MB: Menu CFW + Retro-Go + backup/restauration save states de la console G&W $consola" \
   5 "128MB: Menu CFW + Retro-Go + backup/restauration save states de la console G&W $consola" \
   6 "256MB: Menu CFW + Retro-Go + backup/restauration save states de la console G&W $consola" \
   R "Mise à jour du répertoire du dépôt local Retro-Go"   2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  C)clear
    ./scene/2.2.C-opcion-caratula.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
  1)clear
    ./scene/2.2.1-solo-retro-go-$consola.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
  2)clear
    ./scene/2.2.2-cfw-retro-go-4mb-$consola.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
  3)clear
    ./scene/2.2.3-cfw-retro-go-16mb-$consola.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
  4)clear
    ./scene/2.2.4-cfw-retro-go-64mb-$consola.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
  5)clear
    ./scene/2.2.5-cfw-retro-go-128mb-$consola.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
  6)clear
    ./scene/2.2.6-cfw-retro-go-256mb-$consola.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
  R)clear
    ./scene/2.2.R-actualizacion-retro-go.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
esac
clear
