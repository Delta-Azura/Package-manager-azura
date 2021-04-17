#! /usr/bin/env python3

import os 

def main():
    print("Nous syncronisons les dépôts de votre os")
    os.system("sudo cards sync && sudo cards upgrade")
    install =input("Quels paquets souhaitez vous installer ? : ")
    os.system("sudo cards install " + install )
    flatpak =input("Souhaitez vous installer les flatpaks ? : ")
    if flatpak == yes :
        get_flatpak =input("Quels paquets voulez vous installer ? : ")
        try :
            os.system("flatpak install " + get_flatpak )
        except :
            os.system("sudo cards install flatpak")
            os.system("flatpak install " + get_flatpak ) 
    if flatpak != yes : 
        print("Nous nettoyons les archives binaires")
        os.system("sudo cards purge")
        print("Done")

if __name__ == "__main__":
    main()

