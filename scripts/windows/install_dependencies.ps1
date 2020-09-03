# Get project root directory
Set-Variable -Name PROJ_ROOT -Value (get-item $PSScriptRoot).parent.parent.FullName
Write-Output "Use $PROJ_ROOT as project root"

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
flutter pub global activate protoc_plugin

cd "${PROJ_ROOT}/app"
flutter pub get
cd "$PROJ_ROOT"

cd "${PROJ_ROOT}/functions"
npm install
cd "$PROJ_ROOT"

cd "${PROJ_ROOT}/app"
yarn install
cd "$PROJ_ROOT"
