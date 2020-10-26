#!/bin/bash

set -o pipefail

TEMP_CRED_LOCATION="$TEMP_DIR"

if [ -d "$TEMP_CRED_LOCATION/$CREDENTIAL_REPOSITORY" ]
then
  echo "$TEMP_CRED_LOCATION/$CREDENTIAL_REPOSITORY exists. Remove."
  rm -rf "$TEMP_CRED_LOCATION/$CREDENTIAL_REPOSITORY"
fi

if [ -z "${GITHUB_TOKEN}" ]
then
  echo "GITHUB_TOKEN not found, abort"
  exit 1
else
  echo "GITHUB_TOKEN exist, cloning $CREDENTIAL_REPOSITORY into $TEMP_CRED_LOCATION/$CREDENTIAL_REPOSITORY..."
  git clone https://${GITHUB_TOKEN}@github.com/tianhaoz95/${CREDENTIAL_REPOSITORY}.git $TEMP_CRED_LOCATION/$CREDENTIAL_REPOSITORY
fi

# Create the keystore for signing the Android app.
rm -f $ANDROID_APP_ROOT/key.properties
echo "storePassword=$ANDROID_SIGN_PWD" >> $ANDROID_APP_ROOT/key.properties
echo "keyPassword=$ANDROID_SIGN_PWD" >> $ANDROID_APP_ROOT/key.properties
echo "keyAlias=key" >> $ANDROID_APP_ROOT/key.properties
echo "storeFile=key.jks" >> $ANDROID_APP_ROOT/key.properties

# Create the key file for Google Play Store service account.
# This service account is used by fastlane to auto deploy to
# Google Play Store.
rm -f $ANDROID_APP_ROOT/fastlane/Appfile
echo "json_key_file \"$TEMP_CRED_LOCATION/$CREDENTIAL_REPOSITORY/play_store_service_account_api_key.json\"" >> $ANDROID_APP_ROOT/fastlane/Appfile
echo "package_name \"com.jacksonz.iwfpapp\"" >> $ANDROID_APP_ROOT/fastlane/Appfile

# Copy the keystore into the project area as required by Android studio
rm -f $ANDROID_APP_ROOT/app/key.jks
cp $TEMP_CRED_LOCATION/$CREDENTIAL_REPOSITORY/key.jks $ANDROID_APP_ROOT/app

# Set GitHub Oauth credentials
source "$TEMP_CRED_LOCATION/$CREDENTIAL_REPOSITORY/set_github_auth_credentials.sh"
