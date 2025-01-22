package main

import (
	"fmt"
	"log"
	"os"
)

func CreateFile() {
	fmt.Println("Writing file")
	file, err := os.Create("trial1.txt")

	if err != nil {
		log.Fatal(err)
	}

	file.WriteString("Initial comment")
	file.Close()

}

func main() {

}
