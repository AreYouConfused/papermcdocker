#!/usr/bin/sh
set -e

cd server

URL=https://papermc.io/api/v2/projects/paper

if [ ${MC_VERSION} = latest ]
then
	MC_VERSION=$(curl -s $URL | jq -r ".versions"[-1])
fi
URL=${URL}/versions/${MC_VERSION}

if [ ${PAPER_BUILD} = latest ]
then
	PAPER_BUILD=$(curl -s $URL | jq -r ".builds"[-1])
fi
JAR=paper-${MC_VERSION}-${PAPER_BUILD}.jar
URL=${URL}/builds/${PAPER_BUILD}/downloads/$JAR

if [ ! -e $JAR ]
then
	curl -so $JAR $URL
fi

if [ ! -e eula.txt ]
then
	echo "eula=true" > eula.txt
fi

exec java $JAVA_OPTS -Xmx${MAX_RAM} -jar $JAR -nogui

