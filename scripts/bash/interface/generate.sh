#!/bin/bash

set -o pipefail

# Protobuf location
SRC_DIR=$PROJECTS_ROOT/interfaces

# Intermediate file location
PROTO_TEMP_LOCATION="$TEMP_DIR/proto_temp"
mkdir -p $PROTO_TEMP_LOCATION

# Dart code locations
DART_DST_DIR=$PROJECTS_ROOT/app/lib/services/interfaces

# TypeScript code locations
TS_DST_DIR=$PROJ_ROOT/vendors/firebase/functions/src/interfaces

# Compile Dart interfaces
# rm -rf $DART_DST_DIR/*.dart
protoc -I $SRC_DIR --dart_out=$DART_DST_DIR $SRC_DIR/*.proto

# TODO(tianhaoz95): deprecate this once migrate to server core.
# Compile TypeScript interfaces
# rm -rf $TS_DST_DIR/interfaces.d.ts $TS_DST_DIR/interfaces.js
pbjs -t static-module -w commonjs -o $TS_DST_DIR/interfaces.js $SRC_DIR/*.proto
pbts --out $TS_DST_DIR/interfaces.d.ts $TS_DST_DIR/interfaces.js

# Compile for server core
pbjs -t static-module -w commonjs -o $SERVER_CORE_ROOT/src/interfaces.js $SRC_DIR/*.proto
pbts --out $SERVER_CORE_ROOT/src/interfaces.d.ts $SERVER_CORE_ROOT/src/interfaces.js

# Compile for Vercel shell
pbjs -t static-module -w commonjs -o $VERCEL_ROOT/server/interfaces.js $SRC_DIR/*.proto
pbts --out $VERCEL_ROOT/server/interfaces.d.ts $VERCEL_ROOT/server/interfaces.js

. "$BASH_SCRIPT_DIR/lint_workspace.sh" format
