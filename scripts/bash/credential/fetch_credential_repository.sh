#!/bin/bash

set -o pipefail

if [ -d "$TEMP_DIR/$CREDENTIAL_REPOSITORY" ]
then
  echo "$TEMP_DIR/$CREDENTIAL_REPOSITORY exists. Remove."
  rm -rf "$TEMP_DIR/$CREDENTIAL_REPOSITORY"
fi

if [ -z "${GITHUB_TOKEN}" ]
then
  echo "GITHUB_TOKEN not found, abort"
  exit 1
else
  echo "GITHUB_TOKEN exist, cloning $CREDENTIAL_REPOSITORY into $TEMP_DIR/$CREDENTIAL_REPOSITORY..."
  git clone https://${GITHUB_TOKEN}@github.com/tianhaoz95/${CREDENTIAL_REPOSITORY}.git $TEMP_DIR/$CREDENTIAL_REPOSITORY
fi


