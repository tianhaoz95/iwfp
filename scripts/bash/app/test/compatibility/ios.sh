#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$SERVER_ROOT"

npm run device

cd "$CURRENT_DIR"
