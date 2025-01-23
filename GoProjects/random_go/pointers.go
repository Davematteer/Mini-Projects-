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

func changeName(person Person) Person {
	person.name = "Dan"
	return person
}

func main() {
	person1 := Person{name: "dave", age: 30}

	changedPerson := changeName(person1)

	fmt.Println(changedPerson)
}
