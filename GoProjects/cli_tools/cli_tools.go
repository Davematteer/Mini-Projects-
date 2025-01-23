package main

import (
	"fmt"
	"math"
)

func sqrt(x float64) string {
	if x < 0 {
		return sqrt(-x) + "i"
	}
	return fmt.Sprint(math.Sqrt(x))
}

func main() {
	var fish string
	fish = "water"
	fmt.Print(fish)
	fmt.Println(sqrt(2), sqrt(-4))
}

var number int
var Myvariable = "djkfj"
