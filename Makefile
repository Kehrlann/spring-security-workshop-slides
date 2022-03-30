.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c


reveal.js:
	@echo "🔨 Cloning reveal.js..."
	@git submodule update --init
	@rm reveal.js/index.html
	@ln -s "$(PWD)"/index.html reveal.js/index.html
	@ln -s "$(PWD)"/images reveal.js/images

reveal.js/node_modules: reveal.js/
	@echo "🔨 Installing reveal.js..."
	@cd reveal.js
	@npm install

reveal.js/node_modules/reveal-notes-server:
	@echo "🔨 Installing reveal.js notes server..."
	@cd reveal.js
	@npm install reveal-notes-server

.PHONY: install
install: reveal.js/node_modules/ reveal.js/node_modules/reveal-notes-server/

.PHONY: serve
serve: install
	@cd reveal.js
	@node node_modules/reveal-notes-server

.PHONY: dev
dev: install
	@cd reveal.js
	@npm run start
