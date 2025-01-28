package main

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
)

type Weather struct {
	Weather []struct {
		Main string `json:"main"`
	} `json:"weather"`

	Main struct {
		Temp     float32 `json:"temp"`
		Humidity float32 `json:"humidity"`
	} `json:"main"`

	Wind struct {
		Windspeed float32 `json:"speed"`
	} `json:"wind"`
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

	var weather Weather
	err = json.Unmarshal(body, &weather)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(weather)

}
