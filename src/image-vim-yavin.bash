#!/bin/bash

build-vim-yavin() {
THE_PWD=`pwd`

VIM_USER=${1:-vim}
CONTAINER_NAME=${2:-vim-yavin}

cd #CONTAINER_VIM_YAVIN_HOME#

docker build -t ${CONTAINER_NAME} \
  --squash \
  --build-arg VIMUSER=${VIM_USER} \
  .

vpwd='-v `pwd`:`pwd`'
wpwd='-w `pwd`'

runcommand="`cat <<EOF
#!/bin/bash
${CONTAINER_NAME}() {
  docker run -it --rm \
    ${vpwd} $wpwd \
    -h ${CONTAINER_NAME}.local \
    ${CONTAINER_NAME}
}
EOF
`"

echo "$runcommand" > ~/.containers.d/${CONTAINER_NAME}

cat <<EOF

  Reload your ~/.bash_profile to alias the container command ${CONTAINER_NAME}()

EOF

cd $THE_PWD
}



