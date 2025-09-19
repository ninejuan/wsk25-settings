### ----------------------------------------
### AWS CLI Installation Script
### Updated @ 2025-09-19
### Reference: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
### ----------------------------------------

# Windows
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi

# MacOS
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

# ---
# 만약 awscli v1이 설치되어 있으면 제거해주세요.
sudo yum remove awscli
# ---

# Linux (x86-64bit)
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Linux (Arm)
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Linux (Snap)
sudo snap install aws-cli --classic