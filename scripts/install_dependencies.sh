#!/bin/bash

set -o pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"
SERVER_ROOT="$PROJ_ROOT/vendors/firebase/functions"

flutter channel master
flutter config --enable-web
flutter upgrade
flutter --version

npm install -g yarn
npm install -g prettier
npm install -g protobufjs
flutter pub global activate protoc_plugin

cd $PROJ_ROOT/app
flutter pub get
cd $PROJ_ROOT

cd $SERVER_ROOT
npm install
cd $PROJ_ROOT

cd $PROJ_ROOT/site
yarn install
cd $PROJ_ROOT
