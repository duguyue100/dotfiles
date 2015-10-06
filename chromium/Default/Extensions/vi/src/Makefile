build: background_scripts content_scripts icons

background_scripts: background_scripts/main.js

background_scripts/main.js: background.coffee
	[ -d background_scripts ] || mkdir background_scripts
	coffee --print --compile $< > $@

content_scripts: content_scripts/main.js

content_scripts/main.js: .jquery.js .jquery.keypress.js .clipboard.coffee.js .map.coffee.js .content.coffee.js
	[ -d content_scripts ] || mkdir content_scripts
	cat $^ > $@

.jquery.js:
	curl http://code.jquery.com/jquery-git.min.js > $@

.jquery.keypress.js:
	curl https://raw.githubusercontent.com/dmauro/Keypress/development/keypress.js > $@

.clipboard.coffee.js: clipboard.coffee
	coffee --print --compile $< > $@

.map.coffee.js: map.coffee
	coffee --print --compile $< > $@

.content.coffee.js: content.coffee
	coffee --print --compile $< > $@

icons: icons/16.png icons/48.png icons/128.png

icons/16.png: .chromium.svg
	[ -d icons ] || mkdir icons
	convert +antialias -background transparent .chromium.svg -resize 16x16 $@

icons/48.png: .chromium.svg
	[ -d icons ] || mkdir icons
	convert +antialias -background transparent .chromium.svg -resize 48x48 $@

icons/128.png: .chromium.svg
	[ -d icons ] || mkdir icons
	convert +antialias -background transparent .chromium.svg -resize 128x128 $@

.chromium.svg:
	curl http://upload.wikimedia.org/wikipedia/commons/5/5f/Chromium_11_Logo.svg > .chromium.svg

test:
	cd .. && \
	test

tags:
	ctags --recurse

clean:
	rm --force --recursive .*.js .chromium.svg content_scripts icons tags

.PHONY: build tags
