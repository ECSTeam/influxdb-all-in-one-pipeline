#!/bin/sh
set -e
set -x
basedir=`pwd`/nozzle-source
pomdir=`pwd`/version-output

outdir=`pwd`/build-nozzle-output

cd ${basedir}
cp ${pomdir}/pom.xml .
./mvnw package -DskipTests=true
cp target/influxdb-nozzle.jar ${outdir}
