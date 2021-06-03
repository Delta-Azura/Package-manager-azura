package main

import (
	"fmt"
	"log"
	"io/ioutil"
)

func main() {
	respsio, er := ioutil.ReadFile("/etc/azura.config")
	fmt.Println(string(respsio))
	if er != nil {
		log.Fatal(er)
	}
	
}