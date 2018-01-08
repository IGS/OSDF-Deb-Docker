#!/bin/bash

DEST_DIR=/export

docker run --rm=true -v $DEST_DIR:$DEST_DIR osdf_deb_build
mv $DEST_DIR/osdf*.deb .
