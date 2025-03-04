package main

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"

	"github.com/Davematteer/simple_go_crud_app/pkg/handlers"
)

func main() {
	router := mux.NewRouter()

	router.HandleFunc("/books", handlers.GetAllBooks).Methods(http.MethodGet)

	log.Println("API is running")
	http.ListenAndServe(":4000", router)
}
