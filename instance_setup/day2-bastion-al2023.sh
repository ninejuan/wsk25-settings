#!/bin/bash

### ----------------------------------------
### WorldSkills Korea National Day2 Bastion Host Setup Script
### OS : Amazon Linux 2023
### 본 파일은 과제지에서 지시한 Bastion Host를 생성한 후, 해당 인스턴스를 Setup하기 위한 스크립트입니다.
### user-data가 아니므로 주의하시기 바랍니다.
### Updated @ 2025-09-20
### ----------------------------------------

set -e

sudo dnf update -y

echo "Installing nano, jq, curl..."
sudo dnf install -y nano jq curl

echo "Installing Docker..."
sudo dnf install -y docker
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

echo "Installing kubectl..."
VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
curl -LO "https://dl.k8s.io/release/$VERSION/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

echo "Installing ArgoCD CLI..."
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64

echo "Installing GitHub CLI..."
sudo dnf install -y dnf5-plugins
sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install -y gh --repo gh-cli

echo "Installing Helm..."
sudo dnf install -y helm

echo "Verifying installations..."
echo "Docker version:"
docker --version
echo "AWS CLI version:"
aws --version
echo "Kubectl version:"
kubectl version --client
echo "ArgoCD CLI version:"
argocd version --client
echo "GitHub CLI version:"
gh --version
echo "Helm version:"
helm version
echo "Curl version:"
curl --version
echo "Nano version:"
nano --version
echo "Jq version:"
jq --version
