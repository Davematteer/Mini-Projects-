package main

import (
	"fmt"
)

func swap(a, b string) (string, string) {
	return b, a
}

func main() {
	fmt.Println("My favorite song")

	var x, y string = swap("hi", "yo")

	fmt.Println(x, y)
}

func test(a, b int) (num, count int) {
	num = 2
	count = 3
	return
}
