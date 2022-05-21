FROM openjdk:17-slim

RUN apt-get update && \
	apt-get -y upgrade && \
	apt-get install -y curl jq vim && \
	rm -rf /var/apt/lists/*

ENV MC_VERSION="1.18.2" \
	PAPER_BUILD="latest" \
	MAX_RAM="2G" \
	JAVA_OPTS="-Xms512M"

COPY ./papermc.sh /opt/paper/
RUN mkdir -p /opt/paper/server
RUN useradd -u 1293 -d /opt/paper papermc && \
	chown -R papermc:papermc /opt/paper
USER papermc
WORKDIR /opt/paper

CMD ["sh", "papermc.sh"]

EXPOSE 25565
VOLUME /opt/paper/server

