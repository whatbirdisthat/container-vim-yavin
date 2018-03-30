FROM alpine:latest

RUN apk --no-cache add vim

ARG VIMUSER=yavin

RUN adduser -D -g '' ${VIMUSER}
RUN mkdir /home/${VIMUSER}/.vim
WORKDIR /home/${VIMUSER}/.vim
ADD https://github.com/whatbirdisthat/vim-yavin/releases/download/201711/vim-yavin.tar.gz .
RUN tar xvf vim-yavin.tar.gz && rm vim-yavin.tar.gz
RUN chown -R ${VIMUSER} /home/${VIMUSER}

USER ${VIMUSER}
RUN ln -s /home/${VIMUSER}/.vim/bundle/yavin/vimrc /home/${VIMUSER}/.vimrc
RUN echo 'set shell=/bin/ash' >> /home/${VIMUSER}/.vim/bundle/yavin/vimrc

ENTRYPOINT vim

