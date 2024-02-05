#!/bin/bash
#
# How to: ./sync_images.sh <registry>
#
# Example: ./sync_images.sh registry.example.com/google_containers

mkdir -p /etc/kubeadm

if [ ! -f /etc/kubeadm/config.yaml ]; then
  kubeadm config print init-defaults --component-configs KubeletConfiguration > /etc/kubeadm/config.yaml.example
fi
