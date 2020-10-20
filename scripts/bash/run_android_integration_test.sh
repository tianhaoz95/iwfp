#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$APP_ROOT"

/Users/runner/Library/Android/sdk/tools/bin/avdmanager list
sleep 20
flutter doctor -v
flutter pub get && flutter drive --target=test_driver/app.dart

cd "$CURRENT_DIR"
