set -e

# Specify the OSM version that will be leveraged throughout these instructions
OSM_VERSION=v0.11.0

# Linux curl command only
curl -sL "https://github.com/openservicemesh/osm/releases/download/$OSM_VERSION/osm-$OSM_VERSION-linux-amd64.tar.gz" | tar -vxzf -

sudo mv ./linux-amd64/osm /usr/local/bin/osm
osm version

osm install