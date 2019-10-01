FROM gitpod/workspace-full:latest

ENV ANDROID_HOME=/home/gitpod/tools \
    FLUTTER_HOME=/home/gitpod/flutter

USER root

RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list && \
    apt-get update && \
    apt-get -y install build-essential dart libkrb5-dev gcc make gradle android-tools-adb android-tools-fastboot && \
    apt-get clean && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*;

USER gitpod

RUN cd /home/gitpod && \
    wget -qO flutter_sdk.tar.xz \
    https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.9.1+hotfix.4-stable.tar.xz &&\
    tar -xvf flutter_sdk.tar.xz && \
    rm -f flutter_sdk.tar.xz

RUN cd /home/gitpod && \
    wget -qO android_studio.zip \
    https://dl.google.com/dl/android/studio/ide-zips/3.3.0.20/android-studio-ide-182.5199772-linux.zip && \
    unzip android_studio.zip && \
    rm -f android_studio.zip

# TODO(tianhaoz95): make the name of the SDK file into an environment variable to avoid maintainance issue
RUN cd /home/gitpod && \
    wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip && \
    unzip sdk-tools-linux-4333796.zip && \
    rm -f sdk-tools-linux-4333796.zip

RUN mkdir -p ~/.android && \
    touch ~/.android/repositories.cfg && \
    yes | /home/gitpod/tools/bin/sdkmanager "tools" "platform-tools" &&\
    yes | /home/gitpod/tools/bin/sdkmanager "platforms;android-28" && \
    yes | /home/gitpod/tools/bin/sdkmanager "build-tools;28.0.3"
