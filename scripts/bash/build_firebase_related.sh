#!/bin/bash

set -o pipefail

if [ "$CI" == "true" ]; then
    echo "Install global dependencies."
    sudo apt install -y lcov
    npm install -g firebase-tools yarn
fi

# TODO(tianhaoz95): use the configure FLutter script to do this.
echo "Configure Flutter."
if [[ "$(flutter channel)" == *"* master"* ]]; then
    echo "Already on master."
else
    echo "Switch Flutter to master channel."
    flutter channel master
fi
if [[ "$(flutter config -h)" == *"enable-web: true"* ]]; then
    echo "Web already enabled"
else
    echo "Enable web."
    flutter config --enable-web
fi
flutter upgrade
flutter --version
flutter doctor -v

echo "Build app related."
cd "$APP_ROOT"
echo "Install app dependencies."
flutter pub get
flutter test --coverage
genhtml coverage/lcov.info -o coverage
mv "$APP_ROOT/coverage" "$BUILD_DIR/app_coverage"
flutter build web --target lib/entrypoint/ui.dart
mv "$APP_ROOT/build/web" "$BUILD_DIR/catalog"
flutter build web
mv "$APP_ROOT/build/web" "$BUILD_DIR/web_app"
$DART_BIN/dartdoc \
    --exclude \
    'dart:async,\
        dart:collection,\
        dart:convert,\
        dart:core,\
        dart:developer,\
        dart:io,\
        dart:isolate,\
        dart:math,\
        dart:typed_data,\
        dart:ui,\
        dart:ffi,\
        dart:html,\
        dart:js,\
        dart:js_util'
mv "$APP_ROOT/doc/api" "$BUILD_DIR/app_docs"
cd "$PROJ_ROOT"
echo "App related done."

echo "Build site related."
cd "$SITE_ROOT"
yarn install
yarn docs:build
mv "$SITE_ROOT/docs/.vuepress/dist" "$BUILD_DIR/project_site"
cd "$PROJ_ROOT"
echo "Site related done."

echo "Build server related."
cd "$SERVER_ROOT"
npm install
npm run docs
mv "$SERVER_ROOT/docs" "$BUILD_DIR/server_docs"
cd "$PROJ_ROOT"
echo "Server related done."

echo "Done."