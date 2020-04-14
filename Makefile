build: script.js
	web-ext build --config ./build/build.js --overwrite-dest

clean:
	rm -rf ./web-ext

rebuild: clean build

get-google-matches:
	curl --silent 'https://www.google.com/supported_domains'                                          \
		| jq --raw-input --slurp 'split("\n") | map(select(. != "")) | map("*://www" + . + "/*")' \
		> ./build/google-matches.json

update-matches: get-google-matches
	node ./build/merge.js | sponge manifest.json

.PHONY: build
