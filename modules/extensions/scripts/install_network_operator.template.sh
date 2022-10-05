#!/bin/bash
# Steps taken from: https://github.com/NVIDIA/cloud-native-core/blob/master/install-guides/Ubuntu_Server_v6.2.md#installing-nvidia-network-operator
# NOTE: This script can only be run in an RDMA enabled node with the Mellanox NICs. It WILL FAIL in all other nodes
if [ ! -f .network_operator_completed ]; then

  echo "Installing NVIDIA Network Operator"

  helm repo add mellanox https://mellanox.github.io/network-operator
  helm repo update
  helm install -f ./network-operator-values.yaml -n network-operator --version ${network_operator_version} --create-namespace --wait network-operator mellanox/network-operator > /dev/null 2>&1

  touch .network_operator_completed
fi
