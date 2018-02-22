item = vim-yavin
container = container-$(item)
image = image-$(item)
version = 1.0
tarname = $(package)
distdir = $(tarname)-$(version)

VIM_USER ?= vim

define RUN_COMMAND
#!/bin/bash
docker run -it --rm \
	-v `pwd`:`pwd` -w `pwd` \
	-h $(item).local \
	$(item)
endef
export RUN_COMMAND

create-command:
	@echo "$$RUN_COMMAND" > "/usr/local/bin/${item}"
	@chmod u+x "/usr/local/bin/${item}"

install: create-command
	docker build -t $(item) --squash --build-arg VIMUSER=$(VIM_USER) .

clean: uninstall
	@:

uninstall:
	rm -f /usr/local/bin/$(item)

.PHONY: all clean
