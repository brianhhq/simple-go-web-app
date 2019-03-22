package main

import (
	"log"
	"fmt"
	"net/http"
)

func myHandleFunc(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hey!, you've requested: %s", r.URL.Path)
}

func main() {
	http.HandleFunc("/", myHandleFunc)

	defaultPort := "8080"
	log.Printf("Listening on default port: %s", defaultPort)
	log.Fatal(http.ListenAndServe(":" + defaultPort, nil))
}
