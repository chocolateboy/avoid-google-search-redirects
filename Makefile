IGNORE := build dev Makefile

build: script.js
	web-ext build --overwrite-dest --ignore-files $(IGNORE)

clean:
	rm -rf ./web-ext

rebuild: clean build

build-dir:
	@mkdir -p build

get-google-matches: build-dir
	curl --silent 'https://www.google.com/supported_domains'                                          \
		| jq --raw-input --slurp 'split("\n") | map(select(. != "")) | map("*://www" + . + "/*")' \
		> ./build/google-matches.json

.PHONY: build
