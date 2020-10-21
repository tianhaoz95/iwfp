#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd $SERVER_ROOT

npm run emulator &

cd "$APP_ROOT"

flutter drive --target=test_driver/emulator.dart --browser-name=chrome --release

cd "$CURRENT_DIR"
