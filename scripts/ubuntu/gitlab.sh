#!/bin/bash

wget -O glab.tar.gz https://gitlab.com/gitlab-org/cli/-/releases/v1.46.0/downloads/glab_1.46.0_Linux_armv6.tar.gz
tar -xvf glab.tar.gz -C glab
mv glab/bin/glab ~/.local/bin/glab
rm -rf glab/
