# DOCKER-VERSION 1.2.0
# VERSION 0.1

FROM openfirmware/mapnik
MAINTAINER James Badger <james@jamesbadger.ca>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y ca-certificates node-carto unzip wget

RUN mkdir -p /usr/local/share/maps/style
WORKDIR /usr/local/share/maps/style
RUN wget -q https://github.com/mapbox/osm-bright/archive/master.zip
RUN unzip master.zip

WORKDIR /usr/local/share/maps/style/osm-bright-master
COPY ./osm-bright.osm2pgsql.mml /usr/local/share/maps/style/osm-bright-master/osm-bright/osm-bright.osm2pgsql.mml
COPY ./configure.py /usr/local/share/maps/style/osm-bright-master/configure.py
COPY ./setup.sh /usr/local/share/maps/style/osm-bright-master/setup.sh

VOLUME ["/usr/local/share/maps/style/OSMBright"]

ENTRYPOINT ["/usr/local/share/maps/style/osm-bright-master/setup.sh"]
