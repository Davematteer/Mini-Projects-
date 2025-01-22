package main

import (
	"os"
)

func main() {
	file, err := os.ReadFile("sampledata.txt")

	if err != nil {
		panic(err)
	}

}
