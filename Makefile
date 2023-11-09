.PHONY: help install dependencies clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies \
	vendor

dependencies:
	type php > /dev/null

vendor:
	composer install

clean:
	rm -rf vendor
