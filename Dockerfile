FROM alpine-cpp
#RUN apk update && apk upgrade && apk add vim
RUN apk --no-cache add vim


RUN adduser -D -g '' yavin

RUN mkdir /home/yavin/.ssh
RUN ssh-keyscan -t rsa github.com > /home/yavin/.ssh/known_hosts

RUN chown -R yavin /home/yavin
RUN chown yavin /home/yavin/.ssh
ADD ./id_rsa /home/yavin/.ssh/id_rsa
RUN chown yavin /home/yavin/.ssh/id_rsa
RUN chmod 0400 /home/yavin/.ssh/id_rsa

#RUN git config --global url."https://".insteadOf git://
#RUN git config --global http.sslverify false
USER yavin

RUN git clone git@github.com:whatbirdisthat/vim-yavin.git /home/yavin/.vim
RUN /home/yavin/.vim/bundle/yavin/install.sh

ENTRYPOINT vim

