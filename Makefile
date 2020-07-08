.PHONY: help install dependencies bash clean

NAME := redash

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies \
	build

dependencies:
	type docker > /dev/null

build:
	docker build -t $(NAME) --progress=plain .

sh:
	docker run -it -v ~/.composer:/root/.composer -v $$(pwd):/tmp -w /tmp $(NAME) $@

clean:
	docker image rm -f $(NAME)
