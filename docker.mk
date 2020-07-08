.PHONY: help install dependencies sh make/% clean

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

make/%:
	docker run -it -v ~/.composer:/root/.composer -v $$(pwd):/tmp -w /tmp $(NAME) make $(@F) $(OPTIONS)

clean:
	docker image rm -f $(NAME)
