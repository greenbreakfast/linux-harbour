FROM ubuntu:latest

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gconf2 \
    gconf-service \
    gvfs-bin \
    hunspell-en-us \
    libasound2 \
    libgtk2.0-0 \
    libnotify4 \
    libnss3 \
    libxss1 \
    libxtst6 \
    locales \
    python \
    xdg-utils \
        libgnome-keyring0 \
        gir1.2-gnomekeyring-1.0 \
        libappindicator1 \
    chromium-browser \
    kmod \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.utf8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8

ENTRYPOINT ["chromium-browser", "--temp-profile"]
