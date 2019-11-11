#!/bin/bash
/home/gitpod/android-sdk/tools/bin/sdkmanager "platform-tools" "platforms;android-28" "build-tools;28.0.3"
flutter doctor --android-licenses
flutter doctor -v