package main

import (
	"fmt"
	"os"
)

func main() {
	file, err := os.ReadFile("sampledata.txt")

	if err != nil {
		panic(err)
	}

	fmt.Print(file)

}

func ReadFile(filename string) {
	fmt.Println(filename)
	data, err := os.ReadFile(filename)

	if err != nil {
		panic(err)
	}

	fmt.Println("File name: " + filename)
	fmt.Println("File size: %d\n", len(data))
	fmt.Println("File content: %s\n", data)

}
