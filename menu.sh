#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"
caratula="0"

clear
which dialog > dialog.txt
if grep "/dialog" ./dialog.txt ; then
        echo "Package dialog trouvé, continuez..."
        sleep 0.5
else
        echo "Aucun package dialog nécessaire trouvé, installation..."
        echo " "
        sudo apt-add-repository universe -y
        sudo apt install -y dialog
        echo " "
        echo "installée!!"
        sleep 0.5
fi
clear
dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: menu.sh Utilisateur = $usuario   ////   Console sélectionnée = $consola ------------------" \
--title "Game&Watch - Menu ayuda para el flasheo" \
--ok-label Apply \
--cancel-label Exit \
--menu "
Utilisateur actuel: $usuario
Console sélectionnée: $consola

Sélectionnez l'option souhaitée avec les flèches:" 0 0 0 \
   1 "Changement d'utilisateur. IMPORTANT : la première fois, il est indispensable de l'exécuter pour un fonctionnement correct" \
   2 "Changement de modèle de console (actuel = $console). IMPORTANT : Choisissez le bon modèle pour un fonctionnement correct" \
   3 "Menu d'installation des packages et programmes nécessaires et mise à jour du firmware STLINK" \
   4 "Menu interface: backup/restauration/déblocage, flashage personnalisé avec Retro-Go et états de sauvegarde/restauration" \
   5 "Mettre à jour le dépôt local de ces scripts" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    ./instalacion/1.1-cambio-usuario.sh
    ./menu.sh
    clear;;
  2)clear
    ./instalacion/1.2-cambio-consola.sh
    ./menu.sh
    clear;;
  3)clear
    #source py/bin/activate
    ./1-menu-instalacion.sh
    ./menu.sh
    #deactivate
    clear;;
  4)clear
    # si no existe el directorio py se instala virtualenv, se crear el directorio, se crea un entorno virtual de python en dicho directorio y se instalan los modulos de python requeridos
    if [ ! -d py ]; then
        sudo apt update -y
        sudo apt install -y unzip binutils-arm-none-eabi python3 libhidapi-hidraw0 libftdi1 libftdi1-2 git python3-pip virtualenv
        echo ""
        echo ""
        echo -e "\e[1;34mLe répertoire est créé \"py\", L'environnement python virtuel est créé, activé et les modules nécessaires aux différents dépôts sont installés.\e[0m"
        echo ""
        sleep 2
        mkdir py
        python3 -m virtualenv py
        source py/bin/activate
        echo ""
        echo -e "\e[1;34mModules requis pour le patch -> voir requirements.txt du dépôt du patch\e[0m"
        echo ""
        sleep 1
        wget https://raw.githubusercontent.com/BrianPugh/game-and-watch-patch/main/requirements.txt
        pip3 install -r requirements.txt
        rm requirements.txt
        echo ""
        echo -e "\e[1;34mModules requis pour Retrogo -> voir requirements.txt du dépôt de retrogo\e[0m"
        echo ""
        sleep 1
        wget https://raw.githubusercontent.com/sylverb/game-and-watch-retro-go/msx_wsv_genesis/requirements.txt
        pip3 install -r requirements.txt
        rm requirements.txt
        echo ""
        echo -e "\e[1;34mModules requis pour LCD-Shrinker -> voir requirements.txt du dépôt de LCD-Shrinker\e[0m"
        echo ""
        sleep 1
        wget https://raw.githubusercontent.com/bzhxx/LCD-Game-Shrinker/main/requirements.txt
        pip3 install -r requirements.txt
        rm requirements.txt
        echo -e "\e[1;34mRequirements pour les paquets dépréciés"
        pip3 install Pillow==9.5.0
	clear
    else
        source py/bin/activate
    fi
    ./2-menu-scene-$consola.sh
    deactivate
    ./menu.sh
    clear;;
  5)clear
    git reset --hard
    git pull --recurse-submodules
    sleep 1
    if [[ -n ["$usuario"] ]]; then
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.3-preparacion-sistema.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.4-openocd.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.5-menu-backup-restore-tools.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.6-menu-flashloader.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.7-menu-retro-go.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.8-menu-patch.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.9-menu-LCD-Game-Shrinker.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.10-instalacion-completa.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./2-menu-scene-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./2-menu-scene-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.1-backup-restauracion.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2-retro-go-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2-retro-go-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.1-solo-retro-go-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.1-solo-retro-go-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.R-actualizacion-retro-go.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.C-opcion-caratula.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.H-opcion-herramientas.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./menu.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.1-save-state-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.1-save-state-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.2-save-state-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.2-save-state-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.3-save-state-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.3-save-state-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.4-save-state-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.4-save-state-zelda.sh
    fi
    #read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    if [ $consola = mario ]; then
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./1-menu-instalacion.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./2-menu-scene-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.1-backup-restauracion.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2-retro-go-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.1-solo-retro-go-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.H-opcion-herramientas.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.C-opcion-caratula.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./menu.sh
    fi
    if [ $consola = zelda ]; then
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./1-menu-instalacion.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./2-menu-scene-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.1-backup-restauracion.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2-retro-go-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.1-solo-retro-go-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.H-opcion-herramientas.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.C-opcion-caratula.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./menu.sh
    fi
    if [ $caratula = 0 ]; then
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
    fi
    if [ $caratula = 1 ]; then
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
    fi
    read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    ./menu.sh
    clear;;
esac
deactivate
clear
