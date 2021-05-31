// début de azura en go, this is experimental

package main

// les imports 
import (
	"fmt"
	"os/exec"
	"bufio"
	"os"
)

func lock() {
	// comming soon 
} 

func unlock() {
	// comming soon 
}

func main() {
	fmt.Printf("Hello, world\n")
}

func install () {
	main() 
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Quels paquets voulez-vous installer ? : ")
	packageinstall, _ := reader.ReadString('\n')
	fmt.Printf("coucou")
	exec.Command("sudo cards install ", packageinstall)
	// rajouter arguement
}

func uninstall () {
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Quels paquets voulez-vous désinstaller ? : ")
	packageuninstall, _ := reader.ReadString('\n')
	exec.Command("sudo cards remove ", packageuninstall ) 
	fmt.Printf("Done")
}


// fin du fichier 
