
PREFIX=/usr/local

install:
	cp -f blash $(PREFIX)/bin/blash
	if [ ! -d "/usr/share/blash" ]; then mkdir -p "/usr/share/blash"; fi
	cp -r themes /usr/share/blash/themes
	cp -r config-examples /usr/share/blash/themes
	cp -f Makefile "/usr/share/blash/Makefile"

uninstall:
	rm -f $(PREFIX)/bin/blash
	cd /usr/share && rm -rf -- ./blash/

.PHONY: install uninstall
