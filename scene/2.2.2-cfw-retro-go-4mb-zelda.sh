#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"
proc="4"
caratula="0"

dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.2-cfw-retro-go-4mb-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
--title "G&W CFW + Retro-Go 4MB /// INFO: Utilisateur=$usuario --- Console sélectionnée=$consola --- Roms en /home/$usuario/game-and-watch-retro-go/roms/" \
--ok-label Apply \
--cancel-label Exit \
--menu "
Utilisateur actuel: $usuario
Console sélectionnée: $consola
Option jaquettes: $caratula (0=NO y 1=SI)
Roms: /home/$usuario/game-and-watch-retro-go/roms/

Sélectionnez l'option souhaitée avec les flèches:" 0 0 0 \
   H "Outils et utilitairess" \
   1 "CFW avec les paramètres pour 4Mo" \
   2 "Compilez Retro-Go avec les paramètres de 4 Mo" \
   3 "Flasher Retro-Go avec les paramètres pour 4 Mo" \
   4 "Téléchargez et restaurez les états de sauvegarde avec des paramètres de 4 Mo"   2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  H)clear
    ./scene/2.2.H-opcion-herramientas.sh
    ./scene/2.2.2-cfw-retro-go-4mb-$consola.sh
    clear;;
  1)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "Installer Retro-Go sur la console G&W $consola avec 4MB" \
    --yesno "l est recommandé d'effectuer le processus avec la batterie chargée à 100 % pour éviter des problèmes. Ce processus concerne uniquement une console avec la puce de 4 Mo installée (puce d'origine).\n\n¡¡¡ATTENTION!!!\nSI VOUS AVEZ UNE QUANTITÉ DE MÉMOIRE DIFFÉRENTE, ANNULEZ LE PROCESSUS et une fois revenu au menu, sélectionnez lA BONNE MÉMOIRE.\n\nUn firmware personnalisé sera flashé et comprendra le menu d'origine de la console en plus de l'émulateur Retro-Go. L'émulateur apparaîtra lorsque vous effectuerez la combinaison de boutons \"LEFT\" + \"GAME\". Les roms qui existent dans /home/$usuario/game-and-watch-retro-go/roms/ seront également téléchargés sur la console ¿Voulez-vous continuer?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        if [ -f /home/$usuario/gameandwatch/game-and-watch-backup/backups/flash_backup_$consola.bin ]; then
            echo "flash_backup_$consola.bin trouvé"
            sleep 0.5
            if [ -f /home/$usuario/gameandwatch/game-and-watch-backup/backups/internal_flash_backup_$consola.bin ]; then
                echo "internal_flash_backup_$consola.bin trouvé"
                sleep 0.5
                cp /home/$usuario/gameandwatch/game-and-watch-backup/backups/flash_backup_$consola.bin /home/$usuario/gameandwatch/game-and-watch-patch
                cp /home/$usuario/gameandwatch/game-and-watch-backup/backups/internal_flash_backup_$consola.bin /home/$usuario/gameandwatch/game-and-watch-patch
                echo " "
                echo "Les archives de la flash interne et externe ont été copiées"
                echo " "
                echo " "
                echo "Processus 1/2 terminé."
                echo " "
                echo -e "\e[1;34mSi vous avez déjà exécuté cette option auparavant et que quelque chose ne va pas, déconnectez la console et exécutez à nouveau cette option.\e[0m"
                echo -e "\e[1;34moption et, à ce stade, débranchez la batterie et rebranchez-la avant de procéder comme suit.\e[0m"
                echo " "
                echo " "
                echo -e "\e[1;31mAppuyez et maintenez le bouton d'alimentation, puis appuyez sur n'importe quelle touche pour continuer...\e[0m"
                read -n 1 -s -r -p ""
                clear
                cd /home/$usuario/gameandwatch/game-and-watch-patch
                make clean
                #make PATCH_PARAMS="--internal-only" flash_patched_int
                make PATCH_PARAMS="--device=$consola --extended --no-la --no-sleep-images --extended" flash
                cd -
                echo " "
                echo " "
                echo "Processus 2/2 terminé."
                read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
            else
                echo "internal_flash_backup_$consola.bin introuvable, annulation..."
                sleep 2
            fi
        else
            echo "flash_backup_$consola.bin introuvable, annulation..."
            sleep 2
        fi
        dialog --backtitle "G&W $consola - Utilitaires de flash" \
        --title "Installez le firmware d'origine + Retro-Go sur la console avec 4 Mo" \
        --msgbox "Processus effectué." 0 0
    else
            dialog --backtitle "G&W $consola - Utilitaires de flash" \
            --title "Installez le firmware d'origine + Retro-Go sur la console avec 4 Mo" \
            --msgbox "Processus annulé." 0 0
    fi
    ./scene/2.2.2-cfw-retro-go-4mb-$consola.sh
    clear;;
  2)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "Compiler Retro-Go" \
    --yesno "RetroGo sera compilé et les roms qui existent dans /home/$usuario/game-and-watch-retro-go/roms/ seront incluses. ¿Voulez-vous continuer?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        make clean
        make -j$proc COMPRESS=lzma INTFLASH_BANK=2 EXTFLASH_SIZE=1802240 EXTFLASH_OFFSET=851968 GNW_TARGET=$consola EXTENDED=1 COVERFLOW=$caratula
        cd -
        echo " "
        echo " "
        read -n 1 -s -r -p "Processus terminé. Appuyez sur n'importe quelle touche pour continuer."
        dialog --backtitle "G&W $consola - Utilitaires de flash" \
        --title "Compiler Retro-Go" \
        --msgbox "Processus effectué." 0 0
    else
        dialog --backtitle "G&W $consola - Utilitaires de flash" \
        --title "Compiler Retro-Go" \
        --msgbox "Processus annulé." 0 0
    fi
    ./scene/2.2.2-cfw-retro-go-4mb-$consola.sh
    clear;;
  3)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "Compiler Retro-Go" \
    --yesno "Il est recommandé d'effectuer le processus avec la batterie chargée à 100 % pour éviter des problèmes. Seul l’émulateur Retro-Go sera flashé donc nous n’aurons pas le menu original. Les roms qui existent dans /home/$usuario/game-and-watch-retro-go/roms/ seront également téléchargées sur la console." 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo " "
        echo -e "\e[1;34mSi vous avez déjà exécuté cette option auparavant et que quelque chose ne va pas, démontez la console et exécutez à nouveau cette option.\e[0m"
        echo -e "\e[1;34moption et, à ce stade, débranchez la batterie et rebranchez-la avant de procéder comme suit.\e[0m"
        echo " "
        echo " "
        echo -e "\e[0;32mSi au cours du processus suivant, il nous indique que le Flash a échoué, qu'il ne peut pas se connecter, il faudra effectuer\e[0m"
        echo -e "\e[0;32mfaire un cycle d'alimentation (retirer la batterie, reconnecter et allumer), appuyer sur le bouton d'alimentation et \e[0m"
        echo -e "\e[0;32mle maintenir quelques secondes, nous dirons oui avec \"y\" (oui), puis le processus continuera.\e[0m"
        echo -e "\e[1;31mAppuyez et maintenez le bouton d'alimentation, puis appuyez sur n'importe quelle touche pour continuer...\nATTENTION : Ne relâchez pas le bouton au moins jusqu'à ce qu'il commence à effacer la mémoire externe (quand il est écrit « Erasing xxxx bytes... » sur l'écran).\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        #make clean
        make -j$proc COMPRESS=lzma INTFLASH_BANK=2 EXTFLASH_SIZE=1802240 EXTFLASH_OFFSET=851968 GNW_TARGET=$consola EXTENDED=1 COVERFLOW=$caratula flash
        cd -
        read -n 1 -s -r -p "Processus terminé. Appuyez sur n'importe quelle touche pour continuer."
        dialog --backtitle "G&W $consola - Utilitaires de flash" \
        --title "Installez Retro-Go uniquement" \
        --msgbox "Processus effectué." 0 0
    else
        dialog --backtitle "G&W $consola - Utilitaires de flash" \
        --title "Installez Retro-Go uniquement" \
        --msgbox "Processus annulé." 0 0
    fi
    ./scene/2.2.2-cfw-retro-go-4mb-$consola.sh
    clear;;
    4)clear
    ./scene/2.2.2-save-state-$consola.sh
    ./scene/2.2.2-cfw-retro-go-4mb-$consola.sh
	clear;;
esac
clear
