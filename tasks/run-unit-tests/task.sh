#!/bin/sh
set -e
set -x
basedir=`pwd`/nozzle-source

cd ${basedir}
./mvnw test
