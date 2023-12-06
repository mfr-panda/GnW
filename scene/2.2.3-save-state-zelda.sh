#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"
proc="4"
caratula="0"

clear
dpkg -s libncurses5 > libncurses5.txt
if grep "install ok installed" ./libncurses5.txt ; then
        echo "Paquet trouvé libncurses5, poursuite..."
        sleep 0.5
else
        echo "Aucun package dialog nécessaire trouvé, installation..."
        echo " "
        sudo apt update
        sudo apt install -y libncurses5
        echo " "
        echo "Installé!!"
        sleep 0.5
fi

dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.3-save-state-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
       --msgbox "G&W Utilidad para backup, resturacion y borrado de save states. Una vez descargados los save states estan ubicados en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" 0 0
dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.3-save-state-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
       --title "INFO: Utilisateur=$usuario --- Console sélectionnée=$consola --- Save states in:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
       --ok-label Apply \
       --cancel-label Exit \
       --menu "
Utilisateur actuel: $usuario
Console sélectionnée: $consola
Option jaquettes: $caratula (0=NO y 1=YES)
Save states: /home/$usuario/game-and-watch-retro-go/save_states/

Sélectionnez l'option souhaitée avec les flèches:" 0 0 0 \
          1 "Sauvegardez les états de sauvegarde existants sur le G&W avec une puce de 16 Mo" \
          2 "Restaurez les états de sauvegarde du PC vers le G&W avec une puce de 16 Mo" \
          3 "Supprimez les états de sauvegarde existants sur le G&W avec une puce de 16 Mo pour la laisser propre"   2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.3-save-state-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
           --title "INFO: Utilisateur=$usuario --- Console sélectionnée=$consola --- Save states in:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
           --yesno "ATTENTION!!! Le processus de SAUVEGARDE des états de sauvegarde peut prendre plusieurs minutes en fonction du nombre de roms sur le G&W et son arrêt peut provoquer des erreurs. Voulez-vous continuer?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo -e "\e[1;31mAllumez la console et entrez dans le menu Retro-Go avec les boutons LEFT+GAME et laissez-la en attente dans la liste des roms.\e[0m"
        echo ""
        echo -e "\e[1;31mPour continuer le processus, appuyez sur n'importe quelle touche...\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=12 EXTFLASH_OFFSET=4194304 INTFLASH_BANK=2 GNW_TARGET=$consola COVERFLOW=$caratula flash_saves_backup
        cd -
        echo -e "\e[1;31mAppuyez sur n'importe quelle touche pour continuer...\e[0m"
        read -n 1 -s -r -p ""
        dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.3-save-state-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
               --title "INFO: Utilisateur=$usuario --- Console sélectionnée=$consola --- Save states in:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
               --msgbox "Processus effectué. Etats téléchargés dans:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" 0 0
    else
        dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.3-save-state-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
               --title "INFO: Utilisateur=$usuario --- Console sélectionnée=$consola --- Save states in:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
               --msgbox "Processus annulé." 0 0
    fi
    ./scene/2.2.3-save-state-$consola.sh
    clear;;
  2)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.3-save-state-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
           --title "INFO: Utilisateur=$usuario --- Console sélectionnée=$consola --- Save states in:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
           --yesno "¡ATTENTION!!! Le processus de RESTAURATION des états de sauvegarde peut prendre plusieurs minutes en fonction du nombre de roms dans le G&W et son arrêt peut provoquer des erreurs. Voulez-vous continuer?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo -e "\e[1;31mAllumez la console et entrez dans le menu Retro-Go avec les boutons LEFT+GAME et laissez-la en attente dans la liste des roms.\e[0m"
        echo ""
        echo -e "\e[1;31mPour continuer le processus, appuyez sur n'importe quelle touche...\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=12 EXTFLASH_OFFSET=4194304 INTFLASH_BANK=2 GNW_TARGET=$consola COVERFLOW=$caratula flash_saves_restore
        cd -
        echo -e "\e[1;31mAppuyez sur n'importe quelle touche pour continuer...\e[0m"
        read -n 1 -s -r -p ""
        dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.3-save-state-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
               --title "INFO: Utilisateur=$usuario --- Console sélectionnée=$consola --- Save states in:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
               --msgbox "Processus effectué." 0 0
    else
        dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.3-save-state-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
               --title "INFO: Utilisateur=$usuario --- Console sélectionnée=$consola --- Save states in:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
               --msgbox "Processus annulé." 0 0
    fi
    ./scene/2.2.3-save-state-$consola.sh
    clear;;
  3)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.3-save-state-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
           --title "INFO: Utilisateur=$usuario --- Console sélectionnée=$consola --- Save states in:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
           --yesno "ATTENTION!!! Le processus de SUPPRESSION des états de sauvegarde peut prendre plusieurs minutes en fonction du nombre de roms sur le G&W et son arrêt peut provoquer des erreurs. Voulez-vous continuer?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo -e "\e[1;31mAllumez la console et entrez dans le menu Retro-Go avec les boutons LEFT+GAME et laissez-la en attente dans la liste des roms.\e[0m"
        echo ""
        echo -e "\e[1;31mPour continuer le processus, appuyez sur n'importe quelle touche...\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=12 EXTFLASH_OFFSET=4194304 INTFLASH_BANK=2 GNW_TARGET=$consola COVERFLOW=$caratula flash_saves_erase
        cd -
        echo -e "\e[1;31mAppuyez sur n'importe quelle touche pour continuer...\e[0m"
        read -n 1 -s -r -p ""
        dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.3-save-state-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
               --title "INFO: Utilisateur=$usuario --- Console sélectionnée=$consola --- Save states in:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
               --msgbox "Processus effectué." 0 0
    else
        dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.3-save-state-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
               --title "INFO: Utilisateur=$usuario --- Console sélectionnée=$consola --- Save states in:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
               --msgbox "Processus annulé." 0 0
    fi
    ./scene/2.2.3-save-state-$consola.sh
    clear;;
  4)clear
    ./scene/exportar_srm.sh
    ./scene/2.2.3-save-state-$consola.sh
    clear;;
  5)clear
    ./scene/importar_srm.sh
    ./scene/2.2.3-save-state-$consola.sh
    clear;;
esac
clear
