#!/bin/bash
#By julenvitoria

clear
which java > java.txt
if grep "/java" ./java.txt ; then
        echo "Package Java trouvé, continuation..."
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
