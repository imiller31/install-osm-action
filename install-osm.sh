set -e

# Specify the OSM version that will be leveraged throughout these instructions
OSM_VERSION=v0.11.0

# Linux curl command only
curl -sL "https://github.com/openservicemesh/osm/releases/download/$OSM_VERSION/osm-$OSM_VERSION-linux-amd64.tar.gz" | tar -vxzf -

sudo mv ./linux-amd64/osm /usr/local/bin/osm
osm version

set +e
OSM_INSTALL=$(osm install 2>&1)
exit_code=$?
set -e

echo $OSM_INSTALL

if grep -q "Error: Mesh osm already exists" <<< "$OSM_INSTALL"; then
    osm mesh upgrade
    exit 0
fi

# if the exit code is 1 otherwise, we should error out
if (($exit_code > 0)); then
    echo "Encountered some error in osm install, exiting"
    echo "osm install error is: $OSM_INSTALL"
    exit 1
fi