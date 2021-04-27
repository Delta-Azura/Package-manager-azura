#! /bin/bash
#machin
function main() {
	if [[ $1 ]];then
		echo "Hello world"
		git add $1
		if [[ $? = 1 ]];then
			git init
			read -p "Veuillez rajouter un dépôt de destination : " ask_1
			git remote add origin $ask_1
			git add $1
		fi
		read -p "Décrivez nous en quelques mots les modifications apportées: " ask_2
		git commit -m " ${ask_2} "
		read -p "Nous sommes sur le point de commit vos modifications, avez vous une branche particulière sur laquelle effectuer cette action, si oui laquelle ?  [yes or no] : " ask_3

# les conditions

		if [[ $ask_3 = "no" ]];then
			echo "ok"
			git push -u origin main

		else
			echo "ok"
		fi

		
	       
		

		fi
}
main "$@"
	       

              


