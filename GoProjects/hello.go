package main

import (
	f "fmt"
)

func swap(a, b string) (string, string) {
	return b, a
}

func main() {
	f.Println("My favorite song")

	var x, y string = swap("hi", "yo")

	f.Println(x, y)

	f.Println("Type: %T Value: %v\n", doggy, damn)

}

func test(a, b int) (num, count int) {
	num = 2
	count = 3
	return
}

var yap string = "yapping"

var (
	doggy bool = true
	damn  int  = 2
	guchi uint64
)
