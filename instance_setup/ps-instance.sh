#!/bin/bash

### ----------------------------------------
### WorldSkills Korea National PS Instance Setup Script
### 본 파일은 terraform 프로젝트를 apply하기 위한 Bastion Host를 Setup하기 위한 스크립트입니다.  
### user-data가 아님에 주의하며, apply 및 과제 셋업이 끝난 즉시 인스턴스를 삭제하기 바랍니다.  
### 특히, 3과제의 경우 풀이 시작 1시간이 경과하기 전 해당 인스턴스를 삭제하여야 합니다. 
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

echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

echo "Installing kubectl..."
VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
curl -LO "https://dl.k8s.io/release/$VERSION/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

echo "Installing GitHub CLI..."
sudo dnf install -y dnf5-plugins
sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install -y gh --repo gh-cli

echo "Installing ArgoCD CLI..."
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64

echo "Installing eksctl..."
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl

echo "Installing kubectl argo-rollouts plugin..."
curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64
chmod +x ./kubectl-argo-rollouts-linux-amd64
sudo mv ./kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts

echo "Installing Helm..."
sudo dnf install -y helm

echo "Installing MariaDB 10.5..."
sudo dnf install -y mariadb105

echo "Installing Terraform..."
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo dnf -y install terraform

echo "Verifying installations..."
echo "Docker version:"
docker --version
echo "AWS CLI version:"
aws --version
echo "Kubectl version:"
kubectl version --client
echo "GitHub CLI version:"
gh --version
echo "ArgoCD CLI version:"
argocd version --client
echo "EKSCTL version:"
eksctl version
echo "Argo Rollouts plugin version:"
kubectl argo rollouts version
echo "Helm version:"
helm version
echo "MariaDB version:"
mysql --version
echo "Terraform version:"
terraform --version
echo "Curl version:"
curl --version
echo "Nano version:"
nano --version
echo "Jq version:"
jq --version
