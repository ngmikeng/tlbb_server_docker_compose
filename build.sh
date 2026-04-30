#!/usr/bin/env bash

# Use domestic mirrors to speed up downloads

# mirror_url="mirrors.ustc.edu.cn"
# go_proxy="https://goproxy.cn"

docker buildx build \
  --build-arg GOPROXY="${go_proxy}" \
  --build-arg ALPINE_MIRROR_URL="${mirror_url}" \
  --build-arg DEBIAN_MIRROR_URL="${mirror_url}" \
  -t liuguangw/game_server src