FROM gitpod/workspace-full

ENV FLUTTER_VERSION="v1.12.13+hotfix.8-stable"
ENV DEV_HOME="/home/gitpod/development"
ENV FLUTTER_HOME="${DEV_HOME}/flutter"
ENV FLUTTER_BIN="${FLUTTER_HOME}/bin"
ENV DART_BIN="${FLUTTER_BIN}/cache/dart-sdk/bin/"
ENV PATH="${PATH}:${FLUTTER_BIN}"
ENV PATH="${PATH}:${DART_BIN}"
ENV PATH="${PATH}:${FLUTTER_HOME}/.pub-cache/bin"

RUN mkdir -p ${DEV_HOME} && \
  cd ${DEV_HOME} && \
  wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}.tar.xz && \
  tar -xf ./flutter_linux_${FLUTTER_VERSION}.tar.xz
