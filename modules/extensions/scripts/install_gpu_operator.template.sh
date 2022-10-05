#!/bin/bash
if [ ! -f .gpu_operator_completed ]; then

  echo "Installing NVIDIA GPU Operator"

  helm repo add nvidia https://helm.ngc.nvidia.com/nvidia
  helm repo update
  helm install --version ${gpu_operator_version} --create-namespace --namespace nvidia-gpu-operator --devel nvidia/gpu-operator --wait --generate-name > /dev/null 2>&1
  touch .gpu_operator_completed
fi
