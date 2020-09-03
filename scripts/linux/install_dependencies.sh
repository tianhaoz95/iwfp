#!/bin/bash

set -e
set -o pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
LINUX_SCRIPT_DIR="$(dirname "$SCRIPT_DIR")"
PROJ_ROOT="$(dirname "$LINUX_SCRIPT_DIR")"

flutter channel master
flutter config --enable-web
flutter config --enable-macos-desktop
flutter config --enable-linux-desktop
flutter upgrade
flutter doctor -v
flutter --version

npm install -g yarn
npm install -g prettier
npm install -g protobufjs
export PATH="$FLUTTER_HOME/.pub-cache/bin:$PATH"
flutter pub global activate protoc_plugin

cd $PROJ_ROOT/app
flutter pub get
cd $PROJ_ROOT

cd $PROJ_ROOT/functions
npm install
cd $PROJ_ROOT

cd $PROJ_ROOT/app
yarn install
cd $PROJ_ROOT