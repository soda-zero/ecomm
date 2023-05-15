.DEFAULT_GOAL := run

fmt:
	go fmt ./...
.PHONY: fmt

lint: fmt
	golint ./...
.PHONY: lint

vet: fmt
	go vet ./...
.PHONY: vet

build: vet
	mkdir -p dist
	go build -o dist/app ./cmd/app/main.go
.PHONY: build

run: build
	./dist/app
.PHONY: run

.PHONY: seed

seed:
	psql PGPASSWORD="password" -h "172.18.0.3" -p "5432" -U "postgres"  -d "ecomm" -f ./db/migrations/seed/seed.sql

