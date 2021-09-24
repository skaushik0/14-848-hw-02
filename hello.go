package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	log.Printf("srv: Hello, World!")
	http.HandleFunc("/", worker)
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatalf("srv: %v", err)
	}
}

func worker(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, World!\n")
}
