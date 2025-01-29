package main

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"net/url"
)

func main() {

	var card Card
	fetchData("Dark Magician", card)
}

type Card struct {
	Data []struct {
		Name     string   `json:"name"`
		Typeline []string `json:"typeline"`
		Cardtype string   `json:"type"`
		Attack   int      `json:"atk"`
		Defence  int      `json:"def"`
	} `json:"data"`
}

func fetchData(cardName string, card Card) {

	baseUrl := "https://db.ygoprodeck.com/api/v7/cardinfo.php"
	parameter := url.Values{}
	parameter.Add("name", cardName)
	endpoint := fmt.Sprintf("%s?%s", baseUrl, parameter.Encode())

	res, err := http.Get(endpoint)

	if err != nil {
		log.Fatal(err)
	}

	body, err := io.ReadAll(res.Body)

	if err != nil {
		log.Fatal(err)
	}

	//bodystring := string(body)

	err = json.Unmarshal(body, &card)

	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(card)
}
