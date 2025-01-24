package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
)

func main() {
	response, err := http.Get("https://httpbin.org/get")

	if err != nil {
		log.Fatal(err)
	}

	defer response.Body.Close()

	bodyBytes, err := io.ReadAll(response.Body)

	if err != nil {
		log.Fatal(err)
	}

	bodyString := string(bodyBytes)

	fmt.Println(response.StatusCode)
	fmt.Println(response.Header)
	fmt.Println(bodyString)
}
