#!/bin/bash
#By julenvitoria

echo "Indiquez le nom d'utilisateur avec lequel vous souhaitez exécuter les utilitaires:"
read varname
echo " "
echo "Le nom d'utilisateur saisi est: $varname"
echo " "
echo "¿C'est correct?"
echo -n "Si c'est correct, appuyez sur S pour continuer, sinon sur une autre touche:"
read -n 1 confirm
echo
if [ "$confirm" = "s" ]; then
    confirm="S"
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.3-preparacion-sistema.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.4-openocd.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.5-menu-backup-restore-tools.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.6-menu-flashloader.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.7-menu-retro-go.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.8-menu-patch.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.9-menu-LCD-Game-Shrinker.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.10-instalacion-completa.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./2-menu-scene-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./2-menu-scene-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.1-backup-restauracion.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2-retro-go-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2-retro-go-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.1-solo-retro-go-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.1-solo-retro-go-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.R-actualizacion-retro-go.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.C-opcion-caratula.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.H-opcion-herramientas.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./menu.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.1-save-state-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.1-save-state-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.2-save-state-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.2-save-state-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.3-save-state-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.3-save-state-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.4-save-state-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.4-save-state-zelda.sh
    echo "¡¡Appliqué!!"
    sleep 2
else
    if [ "$confirm" = "S" ]
    then
        confirm="S"
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.3-preparacion-sistema.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.4-openocd.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.5-menu-backup-restore-tools.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.6-menu-flashloader.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.7-menu-retro-go.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.8-menu-patch.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.9-menu-LCD-Game-Shrinker.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.10-instalacion-completa.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./2-menu-scene-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./2-menu-scene-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.1-backup-restauracion.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2-retro-go-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2-retro-go-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.1-solo-retro-go-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.1-solo-retro-go-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.R-actualizacion-retro-go.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.C-opcion-caratula.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.H-opcion-herramientas.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./menu.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.1-save-state-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.1-save-state-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.2-save-state-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.2-save-state-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.3-save-state-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.3-save-state-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.4-save-state-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.4-save-state-zelda.sh
        echo "¡¡Appliqué!!"
        sleep 2
    fi
fi

if [ "$confirm" != "S" ]
then
    echo "Annulé..."
    sleep 3
    exit
fi
