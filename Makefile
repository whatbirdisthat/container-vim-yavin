item = vim
container = container-$(item)
image = image-$(item)

VIM_USER ?= vim

define RUN_COMMAND
#!/bin/bash
docker run -it --rm \
	-v `pwd`:`pwd` -w `pwd` \
	-h $(item).local \
	$(image)
endef
export RUN_COMMAND

create-command:
	@echo "$$RUN_COMMAND" > "/usr/local/bin/${item}"
	@chmod u+x "/usr/local/bin/${item}"

install: create-command
	docker build -t $(image) --squash --build-arg VIMUSER=$(VIM_USER) .

clean: uninstall
	@:

uninstall:
	rm -f /usr/local/bin/$(item)
	@if [ "$(image)" == "$$(docker images $(image) --format {{.Repository}})" ] ; then docker rmi $(image) ; else echo "Image '$(image)' not found. No need to clean." ; fi

.PHONY: all clean
