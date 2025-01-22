package main

import (
	"fmt"
	"os"
	"strings"
)

func main() {
	fmt.Print(ReadLine("sampledata.txt"))
}

func ReadLine(filename string) []string {
	data, err := os.ReadFile(filename)

	if err != nil {
		panic(err)
	}
	data_string := string(data)

	splitString := strings.Split(data_string, " ")

	return splitString

}
