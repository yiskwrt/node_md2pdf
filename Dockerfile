FROM node:lts

RUN echo 'deb http://ftp.jp.debian.org/debian stretch-backports main' >> /etc/apt/sources.list
RUN apt-get update && \
	apt-get -y install libnss3 libatk-bridge2.0-0 libx11-xcb-dev \
		libdrm-dev libxkbcommon-dev libgtk-3-dev libasound-dev \
		fonts-noto-cjk
RUN npm i -g md-to-pdf --unsafe-perm=true
COPY conv /usr/local/bin
RUN chmod a+x /usr/local/bin/conv
VOLUME /workspace
WORKDIR /workspace
