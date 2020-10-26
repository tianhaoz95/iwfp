#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

ENTRYPOINT=$1
ENTRYPOINT_DIR="lib/entrypoint"
ENTRYPOINT_LOCATION="lib/main.dart"
USE_DEVICE=$2

if [ "${ENTRYPOINT}" = "mock" ]; then
    ENTRYPOINT_LOCATION="$ENTRYPOINT_DIR/mock.dart"
elif [ "${ENTRYPOINT}" = "auth" ]; then
    ENTRYPOINT_LOCATION="$ENTRYPOINT_DIR/auth.dart"
elif [ "${ENTRYPOINT}" = "emulator" ]; then
    ENTRYPOINT_LOCATION="$ENTRYPOINT_DIR/emulator.dart"
elif [ "${ENTRYPOINT}" = "error" ]; then
    ENTRYPOINT_LOCATION="$ENTRYPOINT_DIR/error.dart"
elif [ "${ENTRYPOINT}" = "ui" ]; then
    ENTRYPOINT_LOCATION="$ENTRYPOINT_DIR/ui.dart"
elif [ "${ENTRYPOINT}" = "prod" ]; then
    ENTRYPOINT_LOCATION="lib/main.dart"
else
    echo "Usage: android.sh [mode]"
    echo "Entrypoint ${ENTRYPOINT} not supported [mock|auth|emulator|error|ui|prod]."
    exit 1
fi

cd "$APP_ROOT"

echo "Run app with deivce ${USE_DEVICE} and entrypoint ${ENTRYPOINT_LOCATION}"
echo "GitHub Oauth client ID: ${GITHUB_AUTH_CLIENT_ID}"
echo "GitHub Oauth client secret: ${GITHUB_AUTH_CLIENT_SECRET}"

flutter run \
    -t "$ENTRYPOINT_LOCATION" \
    -d "$USE_DEVICE" \
    --dart-define=GITHUB_AUTH_CLIENT_ID=${GITHUB_AUTH_CLIENT_ID} \
    --dart-define=GITHUB_AUTH_CLIENT_SECRET=${GITHUB_AUTH_CLIENT_SECRET}

cd "$CURRENT_DIR"
