FROM ubuntu:latest

ENV ROOT_DIR="/tools"
ENV DEBIAN_FRONTEND="noninteractive"
ENV CHROME_DRIVER_VERSION="86.0.4240.22"
ENV CHROME_DRIVER_ID="chromedriver_linux64"
ENV CHROME_DRIVER_FILENAME="${CHROME_DRIVER_ID}.zip"
ENV EXTRACT_DIR="${ROOT_DIR}/driver"
ENV EXECUTABLE="chromedriver"
ENV USE_PORT="4444"
ENV PATH="$PATH:${EXTRACT_DIR}"
ENV CHROME_DRIVER_DOWNLOAD_URL="https://chromedriver.storage.googleapis.com/${CHROME_DRIVER_VERSION}/${CHROME_DRIVER_FILENAME}"

WORKDIR /tools
EXPOSE 4444

RUN \
  apt update && \
  apt -y upgrade && \
  apt install -y build-essential && \
  apt install -y software-properties-common && \
  apt install -y byobu curl git htop man unzip vim wget

RUN apt install -y gconf-service libasound2 libatk1.0-0 \
    libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 \
    libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 \
    libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 \
    libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 \
    libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 \
    libxtst6 ca-certificates fonts-liberation libappindicator1 \
    libnss3 lsb-release xdg-utils wget

RUN wget "${CHROME_DRIVER_DOWNLOAD_URL}" && unzip "${CHROME_DRIVER_FILENAME}" -d "${EXTRACT_DIR}"

RUN chmod +x ${EXTRACT_DIR}/${EXECUTABLE}

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
