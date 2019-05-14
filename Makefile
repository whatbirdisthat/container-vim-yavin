repo = wbit
item = yavin
container = container-$(item)
image = $(item)
version = 1.0
tarname = $(package)
distdir = $(tarname)-$(version)
#command_loc=/usr/local/sbin/$(item)
command_loc=~/bin/$(item)

check:
	docker run --rm -i hadolint/hadolint < Dockerfile

build: check
	docker build -t $(image) .

define RUN_COMMAND
#!/bin/sh
docker run -it --rm    \
-v `pwd`:`pwd`         \
-w `pwd`               \
-h $(item).local       \
$(image) "$$@"
endef
export RUN_COMMAND

run:
	docker run -it --rm -v `pwd`:`pwd` -w `pwd` $(image)

clean:
	@if [ "$(image)" == "$$(docker images $(image) --format {{.Repository}})" ] ; then docker rmi $(image) ; else echo "Image '$(image)' not found. No need to clean." ; fi

install: build
	@echo "$$RUN_COMMAND" > $(command_loc)
	@chmod ugo+x $(command_loc)

uninstall:
	rm -f $(command_loc)

define HELP_TEXT
YAVIN

The vim container that shouldn't probably be a container
but does ok.

endef

help:
	@:
$(info $(HELP_TEXT))

.PHONY: all clean check
