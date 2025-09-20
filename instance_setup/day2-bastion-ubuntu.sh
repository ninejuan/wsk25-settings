#!/bin/bash

### ----------------------------------------
### WorldSkills Korea National Day2 Bastion Host Setup Script
### OS : Debian/Ubuntu 계열 (Up to Debian 12, Ubuntu 24.04)
### 본 파일은 과제지에서 지시한 Bastion Host를 생성한 후, 해당 인스턴스를 Setup하기 위한 스크립트입니다.
### user-data가 아니므로 주의하시기 바랍니다.
### Updated @ 2025-09-20
### ----------------------------------------

set -e

sudo apt update -y

echo "Installing nano, jq, curl..."
sudo apt install -y nano jq curl

echo "Installing Docker..."
sudo apt install -y docker.io
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

echo "Installing Helm..."
sudo apt-get install curl gpg apt-transport-https --yes
curl -fsSL https://packages.buildkite.com/helm-linux/helm-debian/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://packages.buildkite.com/helm-linux/helm-debian/any/ any main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

echo "Installing MariaDB 10.5..."
sudo apt install -y mariadb-client

echo "Verifying installations..."
echo "Docker version:"
docker --version
echo "AWS CLI version:"
aws --version
echo "Kubectl version:"
kubectl version --client
echo "Helm version:"
helm version
echo "MariaDB version:"
mysql --version
echo "Curl version:"
curl --version
echo "Nano version:"
nano --version
echo "Jq version:"
jq --version

