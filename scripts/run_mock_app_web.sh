#!/bin/bash

set -e
set -o pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"

flutter channel master
flutter config --enable-web
flutter --version

cd $PROJ_ROOT/app
flutter pub get
flutter run -t lib/entrypoint/ui.dart -d web-server --web-port=3300
cd $PROJ_ROOT