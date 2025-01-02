#!/bin/bash

if [[ "$arch" -eq 'x86_64' ]]; then
  # Download
  wget -O glab.tar.gz https://gitlab.com/gitlab-org/cli/-/releases/v1.46.0/downloads/glab_1.46.0_Linux_x86_64.tar.gz

  # Unpack
  mkdir glab
  tar -xzf glab.tar.gz -C glab

  # Install
  mkdir -p ~/.local/bin # If not exists
  mv glab/bin/glab ~/.local/bin/glab

  # Cleanup
  rm -rf glab/
  rm glab.tar.gz
else
  echo "Unsupported processor architecture"
fi

