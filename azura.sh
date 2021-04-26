#! /bin/bash

# Azura in bash :
function lock () {
	if [[ -d /tmp/lock/azura/ ]];then
		echo "azura est déjà lancé"
		exit 
	else
		mkdir /tmp/lock/
		mkdir /tmp/lock/azura/
	fi

}

function unlock () {
	rm -rf /tmp/lock/azura/

}

function compile () {
        sudo cards upgrade && sudo cards install cards.devel
        echo "ok"
       	cd /usr/ports/perso/${@}
       	if [[ $? != 0 ]];then
        	sudo mkdir /usr/ports/perso/
            	echo "Nous venons de créer le répertoire /usr/ports/perso/, nous vous laissons mettre votre pkgfile dans un répertoire possédant le même nom que le paquet à compiler"
        fi
        sudo pkgmk -d 
       	sudo pkgadd ${@}1*
       	if [[ $? != 0 ]];then
        	echo "Quelque chose c'est mal passé"
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
    	if [[ $2 ]];then
        	read -p "Le paquet est-il un flatpak, si oui veuillez préciser ? [o/n] : " flatpak_ask
        	if [[ $flatpak_ask != "n" ]];then
            	flatpak update
            	flatpak install $flatpak_ask
        	else
            	sudo cards upgrade
            	sudo cards install ${2}
            	sudo cards purge
        	fi 
	else
		echo "utilisez un argument"
	fi
}

function remove () {
    	if [[ $2 ]];then
        	read -p "Ces paquets sont-ils des flatpak ? [o/n] : " flatpak_remove_ask
        	if [[ $flatpak_remove_ask != "n" ]];then
        		sudo cards remove $2
        	else
            		flatpak remove $2
        	fi
		sudo cards purge
	else
		echo "utiliser un argument"

	fi
}

function main () { 

    	if [[ $1 = "compile" ]];then
		lock
		shift
		compile ${@}
		unlock
    	fi

    	if [[ $1 = "install" ]];then
		lock
		shift 
        	install ${@}
		unlock
    	fi

    	if [[ $1 = "update" ]];then
		lock
        	update
		unlock
    	fi

    	if [[ $1 = "remove" ]];then
		lock
		shift
        	remove ${@}
		unlock
    	fi
}
main "$@"

