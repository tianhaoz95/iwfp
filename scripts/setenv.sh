# This script should run from the root project directory
rm -f ./iwfpapp/android/key.properties
echo "storePassword=$ANDROID_SIGN_PWD" >> ./iwfpapp/android/key.properties
echo "keyPassword=$ANDROID_SIGN_PWD" >> ./iwfpapp/android/key.properties
echo "keyAlias=key" >> ./iwfpapp/android/key.properties
echo "storeFile=\"$PROJ/$SECRET_REPO/iwfp/key.jks\"" >> ./iwfpapp/android/key.properties

rm -f ./iwfpapp/android/fastlane/Appfile
echo "json_key_file \"$PROJ/$SECRET_REPO/iwfp/play_store_service_account_api_key.json\"" >> ./iwfpapp/android/fastlane/Appfile
echo "package_name \"com.jacksonz.iwfpapp\"" >> ./iwfpapp/android/fastlane/Appfile