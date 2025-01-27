package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
)

type Weather struct {
	Location struct {
		Name    string `json:"name"`
		Country string `json:"country"`
	} `json:"Location"`
	Current struct {
		TempC     float64 `json:"temp_c"`
		Condition struct {
			Text string `json:"text"`
		} `json:"condition"`
	} `json:"current"`
}

func main() {
	API_KEY := os.Getenv("OPENWEATHER_API_KEY")

	if API_KEY == "" {
		fmt.Println("Yooo, your shit is missing")
	}

	lat := 44.34
	lon := 10.99

	api_endpoint := fmt.Sprintf("https://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&appid=%s", lat, lon, API_KEY)
	res, err := http.Get(api_endpoint)

	if err != nil {
		log.Fatal("SHIT WENT WRONG BROOO")
	}

	defer res.Body.Close()

	fmt.Println(res.StatusCode)

	if res.StatusCode != 200 {
		log.Fatal("It didn't work bitch")
	}

	body, err := io.ReadAll(res.Body)

	if err != nil {
		log.Fatal("Bro this shit aint working")
	}
	fmt.Println(string(body))
}
