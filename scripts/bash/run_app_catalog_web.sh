#!/bin/bash

set -o pipefail

flutter channel master
flutter config --enable-web
flutter --version

cd $PROJ_ROOT/app
flutter pub get
flutter run -t lib/entrypoint/ui.dart -d web-server --web-port=3200
cd $PROJ_ROOT