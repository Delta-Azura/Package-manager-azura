// début de azura en go, this is experimental

package main

// les imports 
import "fmt"
import "os/exec"
// need io/ioutil
import "bufio"
import "os"

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


// fin du fichier 
