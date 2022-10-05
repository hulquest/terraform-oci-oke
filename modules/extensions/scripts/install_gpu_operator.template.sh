#!/bin/bash
# Steps taken from: https://github.com/NVIDIA/cloud-native-core/blob/master/install-guides/Ubuntu_Server_v6.2.md#installing-gpu-operator
if [ ! -f .gpu_operator_completed ]; then

  echo "Installing NVIDIA GPU Operator"

  helm repo add nvidia https://helm.ngc.nvidia.com/nvidia
  helm repo update
  helm install --version ${gpu_operator_version} --create-namespace --namespace nvidia-gpu-operator --devel nvidia/gpu-operator --wait --generate-name > /dev/null 2>&1
  touch .gpu_operator_completed
fi
