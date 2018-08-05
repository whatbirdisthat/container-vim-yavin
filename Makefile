repo = wbit
item = yavin
container = container-$(item)
image = image-$(item)
version = 1.0
tarname = $(package)
distdir = $(tarname)-$(version)

build: check
	docker build -t $(repo)/$(item) .

define RUN_COMMAND
#!/bin/sh
docker run -it --rm    \
-v `pwd`:`pwd`         \
-w `pwd`               \
-h $(item).local       \
$(repo)/$(item) "$$@"
endef
export RUN_COMMAND

#
#--env VIMUSER=`whoami` \
#

run:
	docker run -it --rm -v `pwd`:`pwd` -w `pwd` $(repo)/$(item)

clean:
	docker rmi $(repo)/$(item)

install: build
	@echo "$$RUN_COMMAND" > "/usr/local/sbin/${item}"
	@chmod ugo+x "/usr/local/sbin/${item}"

check:
	docker run --rm -i hadolint/hadolint < Dockerfile

uninstall:
	rm -f /usr/local/sbin/$(container)

define HELP_TEXT
YAVIN

The vim container that shouldn't probably be a container
but does ok.

endef

help:
	@:
$(info $(HELP_TEXT))

.PHONY: all clean check
