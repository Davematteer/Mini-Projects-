package handlers

import (
	"encoding/json"
	"io"
	"log"
	"math/rand"
	"net/http"

	"github.com/Davematteer/simple_go_crud_app/pkg/mocks"
	"github.com/Davematteer/simple_go_crud_app/pkg/models"
)

func AddBook(w http.ResponseWriter, r *http.Request) {

	defer r.Body.Close()
	body, err := io.ReadAll(r.Body)
	if err != nil {
		log.Fatal(err)
	}

	var book models.Book

	json.Unmarshal(body, &book)

	// Append to book mocks
	book.ID = rand.Intn(100)
	mocks.Books = append(mocks.Books, book)

	// Send a 201 created response
	w.Header().Add("Content-Type", "application/json")
	w.WriteHeader(http.StatusCreated)
	json.NewEncoder(w).Encode("Created")
}
