#!/usr/bin/env sh

# make sure we have been provided an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <file>" 1>&2
  exit 1
fi

# read the repo and tag name from the Dockerfile's first line
FULL=`head -n 1 "$1" | cut -c 3-`
REPO=`echo "$FULL" | cut -d: -f1`
TAG=`echo "$FULL" | cut -d: -f2`

# build the image in a temporary directory
mkdir -p .tmp
cp "$1" .tmp/Dockerfile

docker build -t="$REPO:$TAG" .tmp
docker tag "$REPO:$TAG" "$REPO:latest"

# cleanup
rm -rf .tmp
