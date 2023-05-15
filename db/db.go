package db

import (
	"context"
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"github.com/jackc/pgx/v5"
	"github.com/joho/godotenv"
)

func Connect() (*pgx.Conn, error) {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}
	conn, err := pgx.Connect(context.Background(), os.Getenv("DATABASE_URL"))
	if err != nil {
		return nil, fmt.Errorf("Unable to connect to the db: %v", err)
	}
	return conn, nil
}

func Migrate(conn *pgx.Conn) error {
	file, err := ioutil.ReadFile("./db/migrations/db.sql")
	if err != nil {
		return fmt.Errorf("error reading db.sql file: %v", err)
	}
	sql := string(file)

	_, err = conn.Exec(context.Background(), sql)
	if err != nil {
		return fmt.Errorf("error executing the migration: %v", err)
	}
	return nil
}

func Seed(conn *pgx.Conn) error {
	file, err := ioutil.ReadFile("./db/seed/seed.sql")
	if err != nil {
		return fmt.Errorf("error reading seed.sql file: %v", err)
	}
	sql := string(file)

	_, err = conn.Exec(context.Background(), sql)
	if err != nil {
		return fmt.Errorf("error executing seed: %v", err)
	}
	return nil
}
