#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$SERVER_ROOT"

npm run lint && npm run build
npm test
npm run e2e

cd "$CURRENT_DIR"
