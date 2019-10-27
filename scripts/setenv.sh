# This script should run from the root project directory
rm -f ./iwfpapp/android/key.properties
echo "storePassword=$ANDROID_SIGN_PWD" >> ./iwfpapp/android/key.properties
echo "keyPassword=$ANDROID_SIGN_PWD" >> ./iwfpapp/android/key.properties
echo "keyAlias=key" >> ./iwfpapp/android/key.properties
echo "storeFile=$ANDROID_SIGN_KEY" >> ./iwfpapp/android/key.properties