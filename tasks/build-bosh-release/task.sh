#!/bin/sh

set -e

apk --update upgrade && apk add --update curl

basedir=`pwd`
versionfile=`pwd`/version/number

num=`cat ${versionfile}`

curl -o ${basedir}/cf-linux-amd64.tgz 'http://cli.run.pivotal.io/stable?release=linux64-binary&source=github-rel'

cd ${basedir}/bosh-release-source

bosh add blob ${basedir}/cf-linux-amd64.tgz cf_cli
bosh add blob ${basedir}/nozzle-binary/influxdb-nozzle.jar influxdb_nozzle

bosh upload blobs
bosh create release --force --final --with-tarball --version ${num}

cp releases/influxdb-nozzle-bosh-release/influxdb-nozzle-bosh-release-${num}.tgz ${basedir}/build-bosh-release-output
