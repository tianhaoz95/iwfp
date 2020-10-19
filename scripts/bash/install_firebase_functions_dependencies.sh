#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

echo "Install server related dependencies."

if [ "$CI" == "true" ]; then
    echo "CI infra detected. Install Firebase CLI."
    npm install -g firebase-tools
fi
cd "$SERVER_ROOT"
npm install

echo "Server related dependencies installed."
cd "$CURRENT_DIR"
