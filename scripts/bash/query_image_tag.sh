#!/bin/bash

set -o pipefail

if [ -z "$GITHUB_REF" ]
then
  echo "GITHUB_REF not found in the environment. Abort."
fi

TAG_NAME="${GITHUB_REF##*/}"

if [[ "$TAG_NAME" =~ ^v([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]
then
  echo "Valid tag name $TAG_NAME detected. Export $TAG_NAME."
  export USE_TAG_NAME=$TAG_NAME
else
  echo "Tag name $TAG_NAME not valid. Use latest instead."
  export USE_TAG_NAME=latest
fi
