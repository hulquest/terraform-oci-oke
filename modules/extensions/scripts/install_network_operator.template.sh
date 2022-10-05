#!/bin/bash
if [ ! -f .network_operator_completed ]; then

  echo "Installing NVIDIA Network Operator"

  helm repo add mellanox https://mellanox.github.io/network-operator
  helm repo update

  kubectl label nodes --all node-role.kubernetes.io/master- --overwrite
  helm install -f ./network-operator-values.yaml -n network-operator --version ${network_operator_version} --create-namespace --wait network-operator mellanox/network-operator > /dev/null 2>&1

  touch .network_operator_completed
fi
