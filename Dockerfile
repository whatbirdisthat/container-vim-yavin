FROM alpine:latest

RUN apk --no-cache add vim git openssh-client bash

ARG VIMUSER=yavin
ARG ID_RSA

RUN adduser -D -g '' ${VIMUSER}

RUN mkdir /home/${VIMUSER}/.ssh
RUN ssh-keyscan -t rsa github.com > /home/${VIMUSER}/.ssh/known_hosts

ENV TMP_ID_RSA ${ID_RSA}
RUN echo "${TMP_ID_RSA}" > /home/${VIMUSER}/.ssh/id_rsa
RUN chmod 0400 /home/${VIMUSER}/.ssh/id_rsa
RUN chown -R ${VIMUSER} /home/${VIMUSER}

#RUN git config --global url."https://".insteadOf git://
#RUN git config --global http.sslverify false
USER ${VIMUSER}

RUN git clone git@github.com:whatbirdisthat/vim-yavin.git /home/${VIMUSER}/.vim
WORKDIR /home/${VIMUSER}/.vim
RUN git submodule init
RUN git submodule update
RUN ln -s /home/${VIMUSER}/.vim/bundle/yavin/vimrc /home/${VIMUSER}/.vimrc

ENTRYPOINT vim

