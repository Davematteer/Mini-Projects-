package main

import (
	"fmt"
	"log"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Bitch dont kill my vibe"))

}

func main() {
	http.HandleFunc("/starting", helloHandler)

	fmt.Println("Server is starting at port 8080")

	log.Fatal(http.ListenAndServe(":8080", nil))
}
