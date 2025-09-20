### ----------------------------------------
### Helm Installation Script
### Updated @ 2025-09-20
### Reference: https://helm.sh/docs/intro/install/
### ----------------------------------------

# Windows
choco install kubernetes-helm

# MacOS
brew install helm

# Linux (Debian/Ubuntu)
sudo apt-get install curl gpg apt-transport-https --yes
curl -fsSL https://packages.buildkite.com/helm-linux/helm-debian/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://packages.buildkite.com/helm-linux/helm-debian/any/ any main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

# Linux (fedora)
sudo dnf install helm

# Linux (from Snap)
sudo snap install helm --classic
