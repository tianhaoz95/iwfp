#!/bin/bash

set -o pipefail

flutter channel master
flutter config --enable-web
flutter upgrade
flutter --version

npm install -g yarn
npm install -g prettier
npm install -g protobufjs
flutter pub global activate protoc_plugin