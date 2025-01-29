package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
)

func main() {
	api_key := ""
	parameters := ""
	endpoint = fmt.Sprintf("")

	res, err := http.Get(endpoint)

	if err != nil {
		log.Fatal(err)
	}

	body, err := io.ReadAll(res.Body)

	if err != nil {
		log.Fatal(err)
	}

	bodystring := string(body)

	fmt.Println(bodystring)

}
