.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c


highlight.js:
	@echo "🔨 Cloning highlight.js..."
	@git submodule update --init highlight.js
	@echo "🔨 Installing highlight.js..."
	@cd highlight.js
	@npm install
	@echo "🔨 Building highlight.js..."
	@npm run build

reveal.js: highlight.js
	@echo "🔨 Cloning reveal.js..."
	@git submodule update --init reveal.js
	@rm reveal.js/index.html
	@ln -s "$(PWD)"/index.html reveal.js/index.html
	@ln -s "$(PWD)"/images reveal.js/images
	@echo "🔨 Installing reveal.js..."
	@cd reveal.js
	@npm install
	#@echo "🔨 Installing reveal.js notes server..."
	#@npm install reveal-notes-server
	@cd ..
	@echo "🔨 Linking highlight.js..."
	@cp highlight.js/build/styles/*.css reveal.js/plugin/highlight

.PHONY: clean
clean:
	@rm -rf reveal.js || true
	@rm -rf highlight.js || true

.PHONY: install
install: reveal.js highlight.js

.PHONY: start
start: install
	@cd reveal.js
	@npm run start

.PHONY: extract-notes
extract-notes:
	@if [[ -z "$(FILE)" ]]; then
		echo "Please specify which file to extract notes from through a \$$FILE variable"
		exit 1
	fi
	awk "
	/## / {
		print $0
	}
	
	/Notes:/ {
		flag=1
		next
	}
	
	/---/ {
		flag=0
		print $0
	}

	# End of the presentation
	/<\/script>/ {
		flag = 0
	}
	
	flag
	" $(FILE)
