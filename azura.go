// début de azura en go, this is experimental

package main

// les imports 
import "fmt"
import "os/exec"

func main() {
	fmt.Printf("Hello, world\n")
}

func install () {
	main() 
	fmt.Printf("coucou")
	exec.Command("sudo cards sync")
	// rajouter arguement
}


// fin du fichier 
