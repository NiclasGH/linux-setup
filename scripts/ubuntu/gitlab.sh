#!/bin/bash

wget -O glab.tar.gz https://gitlab.com/gitlab-org/cli/-/releases/v1.46.0/downloads/glab_1.46.0_Linux_armv6.tar.gz
tar -xvf glab.tar.gz
GLAB_DIR=$(find -name "*glab*" -type d)
mv $GLAB_DIR/bin/glab ~/.local/bin/glab
rm -rf $GLAB_DIR
