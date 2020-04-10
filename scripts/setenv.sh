#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Script absolute path is $SCRIPT_DIR"

PROJ_ROOT="$(dirname "$SCRIPT_DIR")"

echo "Project root path is $PROJ_ROOT"

if [ -z "${ANDROID_SIGN_PWD}" ]
then
  echo "ANDROID_SIGN_PWD not found, abort"
  exit 1
else
  echo "ANDROID_SIGN_PWD detected, proceeding..."
fi

if [ -z "${SECRET_REPO}" ]
then
  echo "SECRET_REPO not found, using jacksonz-secrets..."
  export SECRET_REPO=jacksonz-secrets
else
  echo "SECRET_REPO detected, proceeding..."
fi

if [ -z "${PROJ}" ]
then
  echo "PROJ not found, using /tmp/iwfp as proj directory..."
  export PROJ=/tmp/iwfp
else
  echo "PROJ detected, proceeding..."
fi

if [ -d "$PROJ/$SECRET_REPO" ]
then
  echo "$PROJ/$SECRET_REPO exists"
else
  echo "$PROJ/$SECRET_REPO not found"
  if [ -z "${GITHUB_TOKEN}" ]
  then
    echo "GITHUB_TOKEN not found, abort"
    exit 1
  else
    echo "GITHUB_TOKEN exist, cloning $SECRET_REPO into $PROJ/$SECRET_REPO..."
    git clone https://${GITHUB_TOKEN}@github.com/tianhaoz95/${SECRET_REPO}.git $PROJ/$SECRET_REPO
  fi
fi

# Create the keystore for signing the Android app.
rm -f $PROJ_ROOT/app/android/key.properties
echo "storePassword=$ANDROID_SIGN_PWD" >> $PROJ_ROOT/app/android/key.properties
echo "keyPassword=$ANDROID_SIGN_PWD" >> $PROJ_ROOT/app/android/key.properties
echo "keyAlias=key" >> $PROJ_ROOT/app/android/key.properties
echo "storeFile=key.jks" >> $PROJ_ROOT/app/android/key.properties

# Create the key file for Google Play Store service account.
# This service account is used by fastlane to auto deploy to
# Google Play Store.
rm -f $PROJ_ROOT/app/android/fastlane/Appfile
echo "json_key_file \"$PROJ/$SECRET_REPO/iwfp/play_store_service_account_api_key.json\"" >> $PROJ_ROOT/app/android/fastlane/Appfile
echo "package_name \"com.jacksonz.app\"" >> $PROJ_ROOT/app/android/fastlane/Appfile

# Copy the keystore into the project area as required by Android studio
rm -f $PROJ_ROOT/app/android/app/key.jks
cp $PROJ/$SECRET_REPO/iwfp/key.jks $PROJ_ROOT/app/android/app