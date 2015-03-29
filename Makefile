#
DESTDIR?=/
INSTALL_LOCATION?=$(DESTDIR)/usr/

#
BIN=gohls

all: gohls

_mkdir_gopath:
	mkdir -p tmp/gopath

gohls: _mkdir_gopath
	GOPATH=$(shell realpath tmp/gopath) go get -d
	GOPATH=$(shell realpath tmp/gopath) go build

install: gohls_install

gohls_install:
	mkdir -p $(INSTALL_LOCATION)/bin
	install -o root -g root -m 0755 $(BIN) $(INSTALL_LOCATION)/bin/gohls
	strip $(INSTALL_LOCATION)/bin/gohls

clean:
	rm -f $(BIN)
	rm -rf tmp
