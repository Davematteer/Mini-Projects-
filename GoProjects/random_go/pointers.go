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

	loop := [2]string{"yo"}
	fmt.Println(loop)
	arr2 := []int{1, 2, 3}
	arr2 = append(arr2, 10)
	fmt.Println(arr2)
	score := make(map[string]int)

	score["one"] = 1
	fmt.Println(score)

}

var arr [3]int
