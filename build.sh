#!/bin/bash

echo -e "Building Spark docker images based on MapR PACC (Persistent Application Client Container) ..."

function build_img() {
  local prefix=$1
  local imgname=$2
  local img="${prefix}/${imgname}"

  echo -e "Building docker $img..."

  pushd $(pwd)
  cd $imgname
  docker build -t $img .
  popd
}

IMGPREFIX=hal433

build_img $IMGPREFIX mapr-spark-base
build_img $IMGPREFIX mapr-spark-master
build_img $IMGPREFIX mapr-spark-worker
