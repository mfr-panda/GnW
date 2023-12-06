#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="mario"
caratula="0"

dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.C-opcion-caratula.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
--title "G&W $consola menu jaquettes" \
--msgbox "Bienvenue dans le menu d’options Flash avec jaquettes. Choisissez simplement d'activer ou de désactiver." 0 0
dialog --backtitle "G&W $consola - Utilitaires de flash ------ INFO: 2.2.C-opcion-caratula.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola   //// Option jaquettes = $caratula (0=NO y 1=YES) -----" \
--title "G&W $consola CFW + Retro-Go /// INFO: Utilisateur=$usuario --- Console sélectionnée=$consola --- Option jaquettes=$caratula (0=NO y 1=YES)" \
--ok-label Apply \
--cancel-label Exit \
--menu "Sélectionnez l'option souhaitée avec les flèches:" 14 140 15 \
   A "Activer le flash avec les jaquettes de jeux" \
   D "Désactiver le flash avec les jaquettes de jeux"   2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  A)clear
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2-retro-go-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2-retro-go-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.1-solo-retro-go-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.1-solo-retro-go-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.1-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.1-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.2-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.2-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.3-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.3-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.4-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.4-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.C-opcion-caratula.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./menu.sh
    dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.C-opcion-caratula.sh Utilisateur = $usuario ------------------" \
    --title "G&W $consola menu jaquettes" \
    --msgbox "Option jaquettes ACTIVÉ. REMARQUE : Pour flasher les jaquettes de roms dans le menu, vous devrez placer un fichier jpg, bmp ou png du même nom que la rom dans le même répertoire que la rom et le programme se chargera de le compresser et de le télécharger sur le G&W." 0 0
    #sleep 5;;
	clear;;
  D)clear
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2-retro-go-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2-retro-go-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.1-solo-retro-go-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.1-solo-retro-go-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.1-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.1-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.2-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.2-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.3-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.3-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.4-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.4-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.C-opcion-caratula.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./menu.sh
    dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.C-opcion-caratula.sh Utilisateur = $usuario ------------------" \
    --title "G&W $consola menu jaquettes" \
    --msgbox "Option jaquettes DÉSACTIVÉE." 0 0
    #sleep 5;;
	clear;;
esac
clear
