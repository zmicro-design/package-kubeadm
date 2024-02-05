#!/bin/bash
#
# How to: ./sync_images.sh <registry>
#
# Example: ./sync_images.sh registry.example.com/google_containers

IMAGES=(
  kube-apiserver:v1.29.0
  kube-controller-manager:v1.29.0
  kube-scheduler:v1.29.0
  kube-proxy:v1.29.0
  coredns:v1.11.1
  pause:3.9
  etcd:3.5.10-0
)

if [ -z "$1" ]; then
  echo "Usage: $0 <registry>"
  exit 1
fi

REGISTRY=$1

for image in ${IMAGES[@]}; do
  docker pull registry.aliyuncs.com/google_containers/$image
  docker tag registry.aliyuncs.com/google_containers/$image $REGISTRY/$image
  docker push $REGISTRY/$image
done
