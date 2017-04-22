#!/bin/sh

set -x

BASEDIR=`pwd`

BOSH_RELEASE_DIR=${BASEDIR}/bosh-release-binary
TILE_SOURCE_DIR=${BASEDIR}/tile-source
VERSION_DIR=${BASEDIR}/version

OUTPUT_DIR=${BASEDIR}/build-tile-output

CURRENT_VERSION=`cat ${VERSION_DIR}/version`

cp ${BOSH_RELEASE_DIR}/influxdb-nozzle-bosh-release-$(cat ${BOSH_RELEASE_DIR}/version).tgz \
	${TILE_SOURCE_DIR}/resources/influxdb-nozzle-bosh-release.tgz

cd ${TILE_SOURCE_DIR}
tile build ${CURRENT_VERSION}

cp product/ecsteam-influxdb-${CURRENT_VERSION}.pivotal ${OUTPUT_DIR}
