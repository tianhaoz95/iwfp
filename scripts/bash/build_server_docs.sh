#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$SERVER_ROOT"

npm install && npm run docs

cd "$CURRENT_DIR"
