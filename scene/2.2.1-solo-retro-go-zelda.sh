#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"
proc="4"
caratula="0"

dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.1-solo-retro-go-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
--title "G&W $consola menu Retro-Go + custom firmware" \
--msgbox "Le Flash peut être effectué pour différentes mémoires, choisissez celle qui convient le mieux à votre matériel. REMARQUE : Il est recommandé d'effectuer le processus avec la batterie chargée à 100 % pour éviter les frayeurs.." 0 0
dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.1-solo-retro-go-zelda.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
--title "G&W $consola CFW + Retro-Go /// INFO: Utilisateur=$usuario --- Console sélectionnée=$consola --- Roms en /home/$usuario/game-and-watch-retro-go/roms/" \
--ok-label Apply \
--cancel-label Exit \
--menu "
Utilisateur actuel: $usuario
Console sélectionnée: $consola
Otion jaquettes: $caratula (0=NO y 1=YES)
Roms: /home/$usuario/game-and-watch-retro-go/roms/

Sélectionnez l'option souhaitée avec les flèche:" 0 0 0 \
   H "Outils et utilitaires" \
   1 "4MB: Compilez uniquement Retro-Go sans CFW pour la console $consola originale sans CFW" \
   2 "4MB: Flash uniquement Retro-Go sans CFW sur la console $consola originale sans CFW" \
   3 "16MB: Compilez uniquement Retro-Go sans CFW pour la console $consola sans CFW" \
   4 "16MB: Flash uniquement Retro-Go sans CFW sur la console $consola originale sans CFW" \
   5 "64MB: Compilez uniquement Retro-Go sans CFW pour la console $consola sans CFW" \
   6 "64MB: Flash uniquement Retro-Go sans CFW sur la console $consola originale sans CFW" \
   7 "Télécharger et restaurer les états de sauvegarde avec les paramètres \"solo retro-go\""   2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  H)clear
    ./scene/2.2.H-opcion-herramientas.sh
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  1)clear
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go
    make clean
    make -j$proc COMPRESS=lzma COVERFLOW=$caratula GNW_TARGET=$consola
    read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  2)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.1-solo-retro-go-zelda.sh Utilisateur = $usuario ------------------" \
    --title "Installez uniquement Retro-Go sur la console G&W $consola 4MB sans CFW" \
    --yesno "Il est recommandé d'effectuer le processus avec la batterie chargée à 100 % pour éviter des problèmes. Seul l’émulateur Retro-Go sera flashé donc nous n’aurons pas le menu original. Les roms qui existent dans /home/$user/game-and-watch-retro-go/roms/ seront également téléchargées sur la console." 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo " "
        echo -e "\e[1;34mSi vous avez déjà exécuté cette option auparavant et que quelque chose ne va pas, déconnectez la console et exécutez à nouveau cette option\e[0m"
        echo -e "\e[1;34moption et, à ce stade, débranchez la batterie et rebranchez-la avant de procéder comme suit.\e[0m"
        echo " "
        echo " "
        echo -e "\e[0;32mSi au cours du processus suivant, il nous indique que le Flash a échoué, qu'il ne peut pas se connecter, il faudra effectuer\e[0m"
        echo -e "\e[0;32mfaire un cycle d'alimentation (retirer la batterie, reconnecter et allumer), appuyer sur le bouton d'alimentation et \e[0m"
        echo -e "\e[0;32mle maintenir quelques secondes, nous dirons oui avec \"y\" (oui), puis le processus continuera.\e[0m"
        echo -e "\e[1;31mAppuyez et maintenez le bouton d'alimentation, puis appuyez sur n'importe quelle touche pour continuer...\nATTENTION : Ne relâchez pas le bouton au moins jusqu'à ce qu'il commence à effacer la mémoire externe (quand il est écrit « Erasing xxxx bytes... » sur l'écran).\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        make -j$proc COMPRESS=lzma COVERFLOW=$caratula GNW_TARGET=$consola flash
        read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
        dialog --backtitle "G&W - Utilitaires de flash" \
        --title "Installez Retro-Go uniquement" \
        --msgbox "Processus effectué." 0 0
    else
        dialog --backtitle "G&W - Utilitaires de flash" \
        --title "Installez Retro-Go uniquement" \
        --msgbox "Processus annulé." 0 0
    fi
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  3)clear
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go
    make clean
    make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=16 COVERFLOW=$caratula GNW_TARGET=$consola
    read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  4)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.1-solo-retro-go-zelda.sh Utilisateur = $usuario ------------------" \
    --title "Installez uniquement Retro-Go sur la console G&W $consola 16MB sans CFW" \
    --yesno "Il est recommandé d'effectuer le processus avec la batterie chargée à 100 % pour éviter des problèmes. Seul l’émulateur Retro-Go sera flashé donc nous n’aurons pas le menu original. Les roms qui existent dans /home/$user/game-and-watch-retro-go/roms/ seront également téléchargées sur la console." 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo " "
        echo -e "\e[1;34mSi vous avez déjà exécuté cette option auparavant et que quelque chose ne va pas, déconnectez la console et exécutez à nouveau cette option\e[0m"
        echo -e "\e[1;34moption et, à ce stade, débranchez la batterie et rebranchez-la avant de procéder comme suit.\e[0m"
        echo " "
        echo " "
        echo -e "\e[0;32mSi au cours du processus suivant, il nous indique que le Flash a échoué, qu'il ne peut pas se connecter, il faudra effectuer\e[0m"
        echo -e "\e[0;32mfaire un cycle d'alimentation (retirer la batterie, reconnecter et allumer), appuyer sur le bouton d'alimentation et \e[0m"
        echo -e "\e[0;32mle maintenir quelques secondes, nous dirons oui avec \"y\" (oui), puis le processus continuera.\e[0m"
        echo -e "\e[1;31mAppuyez et maintenez le bouton d'alimentation, puis appuyez sur n'importe quelle touche pour continuer...\nATTENTION : Ne relâchez pas le bouton au moins jusqu'à ce qu'il commence à effacer la mémoire externe (quand il est écrit « Erasing xxxx bytes... » sur l'écran).\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=16 COVERFLOW=$caratula GNW_TARGET=$consola flash
        read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
        dialog --backtitle "G&W - Utilitaires de flash" \
        --title "Installez Retro-Go uniquement" \
        --msgbox "Processus effectué." 0 0
    else
        dialog --backtitle "G&W - Utilitaires de flash" \
        --title "Installez Retro-Go uniquement" \
        --msgbox "Processus annulé." 0 0
    fi
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  5)clear
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go
    make clean
    make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=64 COVERFLOW=$caratula GNW_TARGET=$consola
    read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  6)clear
    dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.1-solo-retro-go-zelda.sh Utilisateur = $usuario ------------------" \
    --title "Installez uniquement Retro-Go sur la console G&W $consola 64MB sans CFW" \
    --yesno "Il est recommandé d'effectuer le processus avec la batterie chargée à 100 % pour éviter des problèmes. Seul l’émulateur Retro-Go sera flashé donc nous n’aurons pas le menu original. Les roms qui existent dans /home/$user/game-and-watch-retro-go/roms/ seront également téléchargées sur la console." 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo " "
        echo -e "\e[1;34mSi vous avez déjà exécuté cette option auparavant et que quelque chose ne va pas, déconnectez la console et exécutez à nouveau cette option\e[0m"
        echo -e "\e[1;34moption et, à ce stade, débranchez la batterie et rebranchez-la avant de procéder comme suit.\e[0m"
        echo " "
        echo " "
        echo -e "\e[0;32mSi au cours du processus suivant, il nous indique que le Flash a échoué, qu'il ne peut pas se connecter, il faudra effectuer\e[0m"
        echo -e "\e[0;32mfaire un cycle d'alimentation (retirer la batterie, reconnecter et allumer), appuyer sur le bouton d'alimentation et \e[0m"
        echo -e "\e[0;32mle maintenir quelques secondes, nous dirons oui avec \"y\" (oui), puis le processus continuera.\e[0m"
        echo -e "\e[1;31mAppuyez et maintenez le bouton d'alimentation, puis appuyez sur n'importe quelle touche pour continuer...\nATTENTION : Ne relâchez pas le bouton au moins jusqu'à ce qu'il commence à effacer la mémoire externe (quand il est écrit « Erasing xxxx bytes... » sur l'écran).\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=64 COVERFLOW=$caratula GNW_TARGET=$consola flash
        read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
        dialog --backtitle "G&W - Utilitaires de flash" \
        --title "Installez Retro-Go uniquement" \
        --msgbox "Processus effectué." 0 0
    else
        dialog --backtitle "G&W - Utilitaires de flash" \
        --title "Installez Retro-Go uniquement" \
        --msgbox "Processus annulé." 0 0
    fi
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  7)clear
    ./scene/2.2.1-save-state-$consola.sh
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
esac
clear
