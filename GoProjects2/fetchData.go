package main

import (
	"fmt"
	"net/http"
	"os"
	"time"
	"errors"
)

const serverPort = 3333

func main(){
	go func() {
		mux := http.NewServeMux()
		mux.HandleFunc("/",func (w http.ResponseWriter, r *http.Request)  {
			fmt.Println("server: %s /\n",r.Method)	
		})
		server := http.Server{
			Addr: fmt.
		}
	}
}