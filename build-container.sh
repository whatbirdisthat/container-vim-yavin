#!/bin/bash

if [ "$ID_RSA" = "" ] ; then

  cat << 'NO_ID_RSA'
ID_RSA environment variable not set - yavin needs at least a deploy key

To set one, try:
export ID_RSA=`cat ~/.ssh/id_rsa`

or:
export ID_RSA=`pass my/private-key`

Then run this build script again.

NO_ID_RSA

  exit 1
fi

VIM_USER=${1:-yavin-iv}
IMAGE_NAME=${2:-yavin-iv}

docker build -t ${IMAGE_NAME} \
  --build-arg VIMUSER=y4 \
  --build-arg ID_RSA="${ID_RSA}" \
  .

