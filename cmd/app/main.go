package main

import (
	"context"
	"log"

	"github.com/zeroCalSoda/ecomm/db"
	"github.com/zeroCalSoda/ecomm/server"
)

func main() {
	conn, err := db.Connect()
	if err != nil {
		log.Fatalf("error connecting to the databse: %s", err)
	}
	defer conn.Close(context.Background())

	err = db.Migrate(conn)
	if err != nil {
		log.Fatalf("error migrating the database: %s", err)
	}

	// err = db.Seed(conn)
	// if err != nil {
	// 	log.Fatalf("error seeding the database: %s", err)
	// }

	port := ":42069"
	server := server.NewServer(port)
	server.InitializeRoutes()
	server.Start()

}
