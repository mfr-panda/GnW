#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"

clear
dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.H-opcion-herramientas.sh Utilisateur = $usuario ------------------" \
       --title "INFO: Utilisateur=$usuario --- Menu Outils et utilitaires" \
       --infobox "G&W Outils et utilitaires" 0 0 ; sleep 1
dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.H-opcion-herramientas.sh Utilisateur = $usuario ------------------" \
       --title "INFO: Utilisateur=$usuario --- Menu Outils et utilitaires" \
       --ok-label Apply \
       --cancel-label Exit \
       --menu "Sélectionnez l'option souhaitée avec les flèches:" 12 140 15 \
          1 "Ouvrez le programme de mise à jour du firmware STlink" \
          2 "Effectuez un make reset (ne le faites que si la console devient noire et n'atteint pas le menu)" \
          3 "Effectuer un test flash (pour vérifier la connexion avec la puce mémoire)"   2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    which java > java.txt
    if grep "/java" ./java.txt ; then
            echo "Package Java trouvé, continuez..."
            sleep 1
    else
            echo "Aucun package Java nécessaire trouvé, installation..."
            echo " "
            sudo apt install -y default-jdk default-jre
            echo " "
            echo "Installé!!"
            sleep 1
    fi
    cd instalacion/actualizador
    sudo java -jar STLinkUpgrade.jar
    cd -
    ./scene/2.2.H-opcion-herramientas.sh
    clear;;
  2)clear
    echo -e "\e[1;31mConnectez la console avec le STlink et appuyez sur n'importe quelle touche pour faire le reset...\e[0m"
    read -n 1 -s -r -p ""
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
    make reset
    cd -
    echo -e "\e[1;31mProcessus terminé. Appuyez sur n'importe quelle touche pour continuer...\e[0m"
    read -n 1 -s -r -p ""
    ./scene/2.2.H-opcion-herramientas.sh
    clear;;
  3)clear
    dialog --backtitle "G&W $consola - Outils et Utilitaires ------------------ INFO: 2.2.H-opcion-herramientas.sh Utilisateur = $usuario ------------------" \
       --msgbox "¡¡¡ATTENTION!!! Le programme de test de la flash externe est chargé dans la mémoire interne pour être exécuté. Cela signifie que si nous avons un dual boot avec CFW+Retro-Go en plus de retrogo, nous devrons également reflasher le CFW car il sera remplacé par le programme flash test. Si nous avons une console avec uniquement Retro-Go, nous devrons reflasher Retro-Go complètement." 0 0
    dialog --backtitle "G&W $consola - Outils et Utilitaires ------------------ INFO: 2.2.H-opcion-herramientas.sh Utilisateur = $usuario ------------------" \
           --title "Herramientas y utilidades G&W" \
           --yesno "¡¡¡IMPORTANT!!! Pour effectuer le processus de test flash, il est nécessaire d'avoir compilé Retro-Go pour votre type de mémoire avec au moins une rom de manière satisfaisante. Si vous ne l'avez pas fait, revenez en arrière et compilez Retro-Go avec au moins une rom. Si vous ne l'avez pas compilé et continuez, cela donnera une erreur et la console restera avec un écran noir. Si vous l'avez déjà fait, poursuivez le processus. ¿Voulez-vous continuer?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo -e "\e[1;31mConnectez la console avec le STlink et appuyez sur n'importe quelle touche pour effectuer le test...\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
        make GNW_TARGET=$consola flash_test
        cd -
        echo -e "\e[1;31mProcessus terminé. Appuyez sur n'importe quelle touche pour continuer...\e[0m"
        read -n 1 -s -r -p ""
        dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.H-opcion-herramientas.sh Utilisateur = $usuario ------------------" \
               --title "INFO: Utilisateur=$usuario --- Menu Outils et utilitaires" \
               --msgbox "Ensuite, un make reset sera effectué car dans la plupart des cas il est utile de pouvoir éteindre la console après avoir effectué le test.." 0 0
        clear
        echo -e "\e[1;31mConnectez la console avec le STlink et appuyez sur n'importe quelle touche pour faire le reset...\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
        make reset
        cd -
        echo -e "\e[1;31mProcessus terminé. Appuyez sur n'importe quelle touche pour continuer...\e[0m"
        read -n 1 -s -r -p ""
        dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.H-opcion-herramientas.sh Utilisateur = $usuario ------------------" \
               --title "INFO: Utilisateur=$usuario --- Menu Outils et utilitaires" \
               --msgbox "¡¡¡ATTENTION!!! Pprocessus effectué, mais RAPPELEZ-VOUS : Le programme de test du flash externe est chargé dans la mémoire interne pour être exécuté. Cela signifie que si nous avons un dual boot avec CFW+Retro-Go, nous devrons reflasher le CFW car il sera remplacé par le programme de test flash. Si nous avons une console avec uniquement Retro-Go, nous devrons reflasher le Retro-Go complètement." 0 0
    else
        dialog --backtitle "G&W $consola - Utilitaires de flash ------------------ INFO: 2.2.H-opcion-herramientas.sh Utilisateur = $usuario ------------------" \
               --title "INFO: Utilisateur=$usuario --- Menu Outils et utilitaires" \
               --msgbox "Processus annulé." 0 0
    fi
    ./scene/2.2.H-opcion-herramientas.sh
    clear;;
esac
clear
