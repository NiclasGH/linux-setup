#!/bin/bash

git clone git@github.com:NiclasGH/linux-setup.git ~/linux-setup
cd ~/linux-setup
chmod +x pull.sh push.sh
./pull.sh
