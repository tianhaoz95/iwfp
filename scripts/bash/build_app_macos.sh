#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$APP_ROOT"

flutter config --enable-macos-desktop
flutter build macos

cd "$CURRENT_DIR"
