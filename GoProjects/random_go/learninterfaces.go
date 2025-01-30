package main

import (
	"fmt"
	"time"
)

func main() {
	go fmt.Println("1")
	go fmt.Println("2")
	go fmt.Println("3")
	go fmt.Println("Yoolo")

	time.Sleep(time.Second)

	ch := make(chan string)

	go func() {
		time.Sleep(time.Second)
		ch <- "Bitch ass nigga"

	}()
}
