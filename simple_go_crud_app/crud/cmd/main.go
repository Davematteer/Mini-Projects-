package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/gorilla/mux"
	gomail "gopkg.in/mail.v2"

	"github.com/Davematteer/simple_go_crud_app/pkg/handlers"
)

func main() {
	router := mux.NewRouter()
	outlookpsw := os.Getenv("APPKEY")

	// routing
	router.HandleFunc("/books", handlers.GetAllBooks).Methods(http.MethodGet)
	router.HandleFunc("/addbooks", handlers.AddBook).Methods(http.MethodPost)
	router.HandleFunc("/books/{id}", handlers.UpdateBook).Methods(http.MethodPut)
	router.HandleFunc("/books/{id}", handlers.GetBook).Methods(http.MethodGet)
	router.HandleFunc("/books/{id}", handlers.DeleteBook).Methods(http.MethodDelete)

	// starting server
	// log.Println("API is running")
	// http.ListenAndServe(":4000", router)
	dialer := gomail.NewDialer(
		"smtp.gmail.com",
		587,
		"daakyemedical@gmail.com",
		outlookpsw,
	)

	dialer.SSL = false
	// sending emails
	message := gomail.NewMessage()

	// setting the headers
	message.SetHeader("From", "daakyemedical@gmail.com")
	message.SetHeader("To", "david.amenumey@ashesi.edu.gh")
	message.SetHeader("Subject", "testing email code")

	// Setting the message body
	message.SetBody("text/plain", "I'm testing the email code")

	// sending the email

	if err := dialer.DialAndSend(message); err != nil {
		fmt.Println("Error:", err)
		panic(err)
	} else {
		fmt.Println("Email has been successfully sent")
	}
}
