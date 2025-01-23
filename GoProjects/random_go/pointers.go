package main

import "fmt"

type Vertex struct {
	X int
	Y int
}

type Person struct {
	name string
	age  int
}

func changeName(person *Person) {
	person.name = "Dan"
	person.age = 2000000
}

func main() {
	person1 := Person{name: "dave", age: 30}

	changeName(&person1)

	fmt.Println(person1)
}
