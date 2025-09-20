### ----------------------------------------
### EKSCTL Installation Script
### Updated @ 2025-09-20
### Reference: https://docs.aws.amazon.com/eks/latest/eksctl/installation.html
### ----------------------------------------

# Windows 설치는 Reference를 참고하시기 바랍니다.

# MacOS
brew tap aws/tap
brew install aws/tap/eksctl

# Linux
# for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl

# Shell completion
# bash
. <(eksctl completion bash)
# zsh
mkdir -p ~/.zsh/completion/
eksctl completion zsh > ~/.zsh/completion/_eksctl
fpath=($fpath ~/.zsh/completion)
# powershell
eksctl completion powershell > C:\Users\Documents\WindowsPowerShell\Scripts\eksctl.ps1
# fish
mkdir -p ~/.config/fish/completions
eksctl completion fish > ~/.config/fish/completions/eksctl.fish