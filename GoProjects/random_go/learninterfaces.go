package main

type shape interface {
	area() float64
	perimeter() float64
}

type rect struct {
	width, height float64
}

func (r *rect) area() float64 {
	return r.height * r.width
}

func (r *rect) perimeter() float64 {
	return 2 * (r.height + r.width)
}
