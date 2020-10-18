#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$APP_ROOT"
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
cd "$CURRENT_DIR"
