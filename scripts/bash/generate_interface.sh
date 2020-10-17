#!/bin/bash

set -o pipefail

# Protobuf location
SRC_DIR=$PROJ_ROOT/interfaces

# Dart code locations
DART_DST_DIR=$PROJ_ROOT/app/lib/services/interfaces

# TypeScript code locations
TS_DST_DIR=$PROJ_ROOT/vendors/firebase/functions/src/interfaces

# Compile Dart interfaces
# rm -rf $DART_DST_DIR/*.dart
protoc -I $SRC_DIR --dart_out=$DART_DST_DIR $SRC_DIR/*.proto

# Compile TypeScript interfaces
# rm -rf $TS_DST_DIR/interfaces.d.ts $TS_DST_DIR/interfaces.js
pbjs -t static-module -w commonjs -o $TS_DST_DIR/interfaces.js $SRC_DIR/*.proto
pbts --out $TS_DST_DIR/interfaces.d.ts $TS_DST_DIR/interfaces.js
