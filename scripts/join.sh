#!/bin/bash

token=$1
discovery_token_ca_cert_hash=$2

if [ -z "$token" ] || [ -z "$discovery_token_ca_cert_hash" ]; then
  echo "Usage: $0 <token> <discovery_token_ca_cert_hash>"
  exit 1
fi

kubeadm join 192.168.96.154:6443 --token $token \
        --discovery-token-ca-cert-hash $discovery_token_ca_cert_hash \
