### ----------------------------------------
### Kubernetes CLI(kubectl) Installation Script
### Updated @ 2025-09-19
### Reference:
### - https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
### - https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
### - https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/
### ----------------------------------------

# Windows
curl.exe -LO "https://dl.k8s.io/release/v1.34.0/bin/windows/amd64/kubectl.exe"
# Append or prepend the kubectl binary folder to your PATH environment variable.

# MacOS
VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt) # or v1.32.0
curl -LO "https://dl.k8s.io/release/$VERSION/bin/darwin/arm64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
sudo chown root: /usr/local/bin/kubectl

# Linux (x86-64bit)
VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt) # or v1.32.0
curl -LO "https://dl.k8s.io/release/$VERSION/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Linux (Arm)
VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt) # or v1.32.0
curl -LO "https://dl.k8s.io/release/$VERSION/bin/linux/arm64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl