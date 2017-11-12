item = vim-yavin
container = container-$(item)
image = image-$(item)
version = 1.0
tarname = $(package)
distdir = $(tarname)-$(version)

install: 
	rm -f ${HOME}/.containers.d/$(container)
	rm -f ${HOME}/.containers.d/$(image)
	ln -s ${PWD}/src/$(container).bash ${HOME}/.containers.d/$(container)
	cp ${PWD}/src/$(image).bash ${HOME}/.containers.d/$(image)
	sed -i '' 's|#CONTAINER_VIM_YAVIN_HOME#|${PWD}|g' ${HOME}/.containers.d/$(image)

uninstall:
	rm -f ${HOME}/.containers.d/$(container)
	rm -f ${HOME}/.containers.d/$(image)

.PHONY: all clean
