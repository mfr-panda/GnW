#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"

dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.1-backup-restauracion.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
--title "G&W menu backup/restauration/déblocage" \
--msgbox "VEUILLEZ LIRE / TRÈS IMPORTANT:\n\nDeux règles sont obligatoires:\n1ª - Ne débranchez JAMAIS le stlink de l'usb\n2ª - NE JAMAIS passer à l'étape suivante si l'étape actuelle vous a donné une erreur.\n\nLe processus de publication comprend 5 étapes. Chacun est responsable d’un processus vital de déblocage et vous ne devez pas passer à l’étape suivante tant que vous n’avez pas terminé celle en cours. À certaines étapes, l'ordinateur nous donnera des instructions sur la façon de procéder. Il est important de les suivre exactement tels qu’ils sont indiqués. De plus, il peut parfois sembler que le processus s’est arrêté, mais ce n’est pas le cas ; certaines étapes peuvent prendre jusqu'à 5 minutes. REMARQUE : Il est recommandé d'effectuer le processus avec la batterie chargée à 100 % pour éviter les catastrophes.." 0 0
dialog --backtitle "G&W $consola - Utilitaires de flash" \
--title "G&W menu backup/restauration/déblocage" \
--ok-label Apply \
--cancel-label Exit \
--menu "
Console sélectionnée: $consola

Sélectionnez l'option souhaitée avec les flèches:" 0 0 0 \
   1 "Sanity check: vérifier les dépendances et les éléments nécessaires." \
   2 "Backup flash externe: fait une sauvegarde du flash SPI. Ne modifie pas le contenu." \
   3 "Backup de la flash interne: ATTENTION : le contenu du flash SPI du point précédent est modifié. Cela peut prendre jusqu'à 5 minutes" \
   4 "Déverrouillage la console : désactive la protection en écriture. ATTENTION : ce processus SUPPRIME le flash STM32" \
   5 "Restaurer le firmware d'origine" \
   6 "Faire une copie du firmware téléchargé" \
   7 "Supprimez le firmware téléchargé. ATTENTION : faites ceci si vous comptez flasher un nouveau G&W" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "G&W Sanity check" \
    --msgbox "Une vérification des éléments nécessaires est effectuée." 0 0
    clear
    cd /home/$usuario/gameandwatch/game-and-watch-backup
    ./1_sanity_check.sh stlink $consola
    read -n 1 -s -r -p "Processus effectué. Appuyez sur n'importe quelle touche pour continue"
    dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "G&W Sanity check" \
    --msgbox "Si le processus a renvoyé une erreur, réinstallez le logiciel à partir du menu d'installation." 0 0
    cd -
    ./scene/2.1-backup-restauracion.sh
    clear;;
  2)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "Backup flash externe" \
    --msgbox "Il est recommandé d'effectuer le processus avec la batterie chargée à 100 % pour éviter des problèmes." 0 0
    clear
    cd /home/$usuario/gameandwatch/game-and-watch-backup
    ./2_backup_flash.sh stlink $consola
    read -n 1 -s -r -p "Processus effectué. Appuyez sur n'importe quelle touche pour continuer"
    dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "Backup flash externe" \
    --msgbox "Si le processus a renvoyé une erreur indiquant qu'il ne peut pas se connecter à la console, maintenez enfoncé le bouton d'alimentation et répétez le processus." 0 0
    cd -
    ./scene/2.1-backup-restauracion.sh
    clear;;
  3)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "Backup de la flash interne" \
    --msgbox "Il est recommandé d'effectuer le processus avec la batterie chargée à 100% pour éviter des problèmes." 0 0
    clear
    cd /home/$usuario/gameandwatch/game-and-watch-backup
    ./3_backup_internal_flash.sh stlink $consola
    read -n 1 -s -r -p "Processus effectué. Appuyez sur n'importe quelle touche pour continuer"
    dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "Backup de la flash intern2" \
    --msgbox "Si le processus a renvoyé une erreur indiquant qu'il ne peut pas se connecter à la console, maintenez enfoncé le bouton d'alimentation et répétez le processus." 0 0
    cd -
    ./scene/2.1-backup-restauracion.sh
    clear;;
  4)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "Déblocage de la console" \
    --msgbox "Il est recommandé d'effectuer le processus avec la batterie chargée à 100% pour éviter les problèmes." 0 0
    clear
    cd /home/$usuario/gameandwatch/game-and-watch-backup
    ./4_unlock_device.sh stlink $consola
    read -n 1 -s -r -p "Processus effectué. Appuyez sur n'importe quelle touche pour continuer"
    dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "Déblocage de la console" \
    --msgbox "Si le processus a renvoyé une erreur indiquant qu'il ne peut pas se connecter à la console, maintenez enfoncé le bouton d'alimentation et répétez le processus." 0 0
    cd -
    ./scene/2.1-backup-restauracion.sh
    clear;;
  5)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "Restaurer le firmware d'origine" \
    --msgbox "Il est recommandé d'effectuer le processus avec la batterie chargée à 100% pour éviter les problèmes." 0 0
    clear
    echo " "
    echo " "
    echo -e "\e[1;31mVeuillez éteindre la console, puis appuyer sur le bouton d'alimentation et le maintenir enfoncé pendant quelques secondes jusqu'à ce que le processus de clignotement commence. Tout en maintenant le bouton enfoncé, appuyez sur n’importe quelle touche pour continuer et le processus commencera.\e[0m"
    read -n 1 -s -r -p ""
    cd /home/$usuario/gameandwatch/game-and-watch-backup
    ./5_restore.sh stlink $consola
    echo " "
    echo " "
    echo " "
    echo -e "\e[1;31mProcessus effectué. Retirez le connecteur de la batterie et rebranchez-le, puis allumez la console. Le Frimwaree d'origine devrait fonctionner.\e[0m"
    echo " "
    read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "Restaurer le firmware d'origine" \
    --msgbox "Si le processus a renvoyé une erreur indiquant qu'il ne peut pas se connecter à la console, maintenez enfoncé le bouton d'alimentation et répétez le processus.." 0 0
    cd -
    ./scene/2.1-backup-restauracion.sh
    clear;;
  6)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "Faire une copie de sécurite du firmware téléchargé" \
    --yesno "Les fichiers du firmware téléchargé depuis la console seront sauvegardés sur/home/$usuario/gameandwatch/firms/$consola. Au sein de ce répertoire, un sous-répertoire sera créé avec la date et l'heure d'exécution de ce processus. Voulez-vous continuer?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        if [ -f /home/$usuario/gameandwatch/game-and-watch-backup/backups/flash_backup_$consola.bin ]; then
            echo "flash_backup_$consola.bin trouvé"
            sleep 1
            if [ -f /home/$usuario/gameandwatch/game-and-watch-backup/backups/internal_flash_backup_$consola.bin ]; then
                echo "internal_flash_backup_$consola.bin trouvé"
                sleep 1
                if [ -d /home/$usuario/gameandwatch/firms/ ]; then
                    if [ -d /home/$usuario/gameandwatch/firms/$consola ]; then
                        rsync -ab /home/$usuario/gameandwatch/game-and-watch-backup/backups/*_mario.bin /home/$usuario/gameandwatch/firms/mario/$(date +%d-%m-%Y_%H:%M:%S)
                    else
                        mkdir /home/$usuario/gameandwatch/firms/$consola
                        rsync -ab /home/$usuario/gameandwatch/game-and-watch-backup/backups/*_$consola.bin /home/$usuario/gameandwatch/firms/$consola/$(date +%d-%m-%Y_%H:%M:%S)
                    fi
                else
                    mkdir /home/$usuario/gameandwatch/firms
                    mkdir /home/$usuario/gameandwatch/firms/$consola
                    rsync -ab /home/$usuario/gameandwatch/game-and-watch-backup/backups/*_$consola.bin /home/$usuario/gameandwatch/firms/$consola/$(date +%d-%m-%Y_%H:%M:%S)
                 fi
                echo " "
                echo "Les fichiers ont été copiés à partir de la flash interne et externe"
                echo " "
                sleep 2
            else
                echo "internal_flash_backup_$consola.bin introuvable, annulation..."
                sleep 2
            fi
        else
            echo "flash_backup_$consola.bin introuvable, annulation..."
            sleep 2
        fi
        #mkdir /home/$usuario/gameandwatch/firms/$(date +%d-%m-%Y_%H:%M:%S) | cp /home/$usuario/gameandwatch/game-and-watch-backup/backups/*.bin /home/$usuario/gameandwatch/firms/$(date +%d-%m-%Y_%H:%M:%S)
        dialog --backtitle "G&W $consola - Utilitaires de flash" \
        --title "Faire une copie de sécurite du firmware téléchargé de Game&Watch $consola" \
        --msgbox "Processus effectué." 0 0
    else
        dialog --backtitle "G&W $consola - Utilitaires de flash" \
        --title "Faire une copie de sécurite du firmware téléchargé de Game&Watch $consola" \
        --msgbox "Processus annulé." 0 0
    fi
    ./scene/2.1-backup-restauracion.sh
    clear;;
  7)clear
      dialog --backtitle "G&W $consola - Utilitaires de flash" \
    --title "Supprimer le firmware téléchargé Game&Watch $consola" \
    --yesno "Les fichiers du firmware téléchargés depuis la console seront supprimés. IL EST FORTEMENT RECOMMANDÉ d'avoir une sauvegarde de ces fichiers. Les scripts n'effectuent pas la sauvegarde automatiquement, elle doit donc être effectuée manuellement avec l'option 6 du menu \"Backup, restauration et déblocage\". ¿Voulez-vous continuer?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        if [ -f /home/$usuario/gameandwatch/game-and-watch-backup/backups/flash_backup_$consola.bin ]; then
            echo "Suppression flash_backup.bin"
            rm /home/$usuario/gameandwatch/game-and-watch-backup/backups/flash_backup_$consola.bin
        else
            echo "flash_backup_$consola.bin introuvable"
        fi
        if [ -f /home/$usuario/gameandwatch/game-and-watch-backup/backups/internal_flash_backup_$consola.bin ]; then
            echo "Suppression internal_flash_backup.bin"
            rm /home/$usuario/gameandwatch/game-and-watch-backup/backups/internal_flash_backup_$consola.bin
         else
             echo "internal_flash_backup_$consola.bin introuvable"
        fi
        sleep 3
         dialog --backtitle "G&W $consola - Utilitaires de flash" \
        --title "Supprimer le firmware téléchargé de Game&Watch $consola" \
        --msgbox "Processus effectué." 0 0
    else
        dialog --backtitle "G&W $consola - Utilitaires de flash" \
        --title "Supprimer le firmware téléchargé de Game&Watch $consola" \
        --msgbox "Processus annulé." 0 0
    fi
    ./scene/2.1-backup-restauracion.sh
    clear;;
esac
clear
