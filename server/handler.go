package server

import (
	"fmt"
	"log"
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
)

type Server struct {
	router *chi.Mux
	port   string
}

func NewServer(port string) *Server {
	return &Server{
		router: chi.NewRouter(),
		port:   port}
}

func (s *Server) InitializeRoutes() {
	s.router.Use(middleware.Logger)
	s.router.Get("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Welcome"))
	})
}

func (s *Server) Start() {
	fmt.Printf("Server listening on http://localhost%s/\n", s.port)
	log.Fatal(http.ListenAndServe(s.port, s.router))
}
