#! /bin/bash

# Azura in bash :

function help () {
	echo "azura install = installe les paquets spécifiés"
	echo "azura remove = supprime les paquets spécifiés"
	echo "azura compile = compile un paquet depuis un raincoat"
	echo "azura update = met à jour : les flatpaks, le système et vos paquets"
}

function lock () {
	if [[ -d /var/cache/azura ]];then
		echo "azura est déjà lancé, si vous pensez qu'il s'agit d'une erreur, supprimez /var/cache:azura"
		exit 
	else
		sudo mkdir /var/cache/azura
	fi

}

function unlock () {
	sudo rm -rf /var/cache/azura

}

function compile () {
        sudo cards upgrade
        echo "ok"
	if [[ -d /usr/ports/azura/${@} ]];then
		cd /usr/ports/azura/${@}
		source_compile=$(cat /usr/ports/azura/${@}/source )
		sudo mkdir /usr/ports/azura/${@}/work
		cd /usr/ports/azura/${@}/work	
		wget -c $source_compile
		cd /usr/ports/azura/${@}
		build=$(cat /usr/ports/azura/${@}/build)
		cd /usr/ports/azura/${@}/work/
		${build}
		
	else 
		echo "Votre raincoat n'est pas placé au bon endroit"
		exit

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
    	read -p "Le paquet est-il un flatpak ? [o/n] : " flatpak_ask
        if [[ $flatpak_ask != "n" ]];then
		flatpak update
           	flatpak install ${@}
        else
            	sudo cards upgrade
            	sudo cards install ${@}
            	sudo cards purge
        fi
}

function remove () {
	flatpak remove ${@} >/dev/null 2>&1
	if [[ $? != 0 ]];then
		sudo cards remove ${@} >/dev/null 2>&1
		sudo cards purge
		echo "Done"
	else
		echo "Done"
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

	if [[ $1 = "help" ]];then
		help
	fi
}

main "$@"

