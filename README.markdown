# docker-osm-bright

A Docker image with the [OSM-Bright](https://github.com/mapbox/osm-bright) data.

## Build Instructions

Can be built from the Dockerfile:

    # docker build -t openfirmware/osm-bright github.com/openfirmware/docker-osm-bright.git

This currently installs OSM Bright from the master git branch.

## Using OSM Bright

You will need to pull and build my `postgres-osm` and `shapefiles` images:

...

Then use those when creating the osm-bright container:

    $ sudo docker run --volumes-from shapefiles --link postgres-osm:pg --name osm-bright openfirmware/osm-bright

You can configure the map extents using the `EXTENTS` environment variable. If not set, it will default to "-20037508.34,-20037508.34,20037508.34,20037508.34".

## About

This Dockerfile was built with information from the [Ubuntu 14.04 Switch2OSM guide](http://switch2osm.org/serving-tiles/manually-building-a-tile-server-14-04/).

## Related Docker Images

* [Postgres-OSM Image](https://github.com/openfirmware/docker-postgres-osm)

