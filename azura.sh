#! /bin/bash

# Azura in bash :

function compile () {
    if [[ $2 ]];then
        sudo cards upgrade && sudo cards install cards.devel
        echo "ok"
        cd /usr/ports/perso/
        if [[ $? != 0 ]];then
            sudo mkdir /usr/ports/perso/
            echo "Nous venons de créer le répertoire /usr/ports/perso/, nous vous laissons mettre votre pkgfile dans un répertoire possédant le même nom que le paquet à compiler"
        fi
        pkgmk -d 
        pkgadd ${2}1*
        if [[ $? != 0 ]];then
            echo "Quelque chose c'est mal passé"
        fi
        echo "Done"
    fi
                
}

function update () {
    echo "Nous mettons votre os à jour"
    sudo cards upgrade 
    read -p "Des mises à jour de flatpak sont peut-être disponibles, souhaitez les effectuer ? [o/n] : " flatpak_update_ask
    if [[ $flatpak_update_ask != "o" ]];then
        echo "ok"
    else
        flatpak update
    fi
    sudo cards purge 

}

function install () {
    if [[ $4 ]];then
        read -p "Le paquet est-il un flatpak, si oui veuillez préciser ? [o/n] : " flatpak_ask
        if [[ $flatpak_ask != "n" ]];then
            flatpak update
            flatpak install $flatpak_ask
        else
            sudo cards upgrade
            sudo cards install ${4}
            sudo cards purge
        fi 
    fi
}

function remove () {
    if [[ $6 ]];then
        read -p "Ces paquets sont-ils des flatpak ? [o/n] : " flatpak_remove_ask
        if [[ $flatpak_remove_ask != "n" ]];then
            sudo cards remove $6
        else
            flatpak remove $6
        fi
        sudo cards purge
    fi
}

function main () {
    # Les arguments 
    if [[ $1 = "compile" ]];then
        compile
    fi
    if [[ $3 = "install" ]];then
        install
    fi

    if [[ $5 = "update" ]];then
        update
    fi

    if [[ $7 = "remove" ]];then
        remove
    fi
}



# Thanks to all the contributors
