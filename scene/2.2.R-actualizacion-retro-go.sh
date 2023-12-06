#!/bin/bash
#By julenvitoria

usuario="kde"

clear
if [ -d /home/$usuario/gameandwatch/game-and-watch-retro-go ]; then
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go
    git pull --recurse-submodules
    read -n 1 -s -r -p "Appuyez sur n'importe quelle touche pour continuer"
    cd -
else
    echo "Répertoire du dépôt non détecté, impossible de continuer."
fi
