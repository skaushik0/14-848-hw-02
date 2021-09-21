# Builds the binary and copies it to the Docker container.
.DEFAULT_GOAL := all
SRC_DIR       := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
PROG_NAME     := hello
BIN_DIR       := $(SRC_DIR)/bin
VERSION       := v0.1
DOCKER_TAG    := "skaushik0/14-848-hw-02:$(VERSION)"

init:
	mkdir -p $(BIN_DIR)

build:
	go fmt ./...
	GOARCH="amd64" GOOS="linux" go build -o $(BIN_DIR)/$(PROG_NAME) $(SRC_DIR)/$(PROG_NAME).go
	docker build -t $(DOCKER_TAG) $(SRC_DIR)

push:
	docker push $(DOCKER_TAG)

all: init build push

.PHONY: init build push all
