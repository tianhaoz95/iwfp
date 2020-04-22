#!/bin/bash

set -e
set -o pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"

flutter channel master
flutter config --enable-web
flutter upgrade
flutter --version

npm install -g yarn
npm install -g prettier
npm install -g protobufjs
flutter pub global activate protoc_plugin