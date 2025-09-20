# WSK25 Settings
---
본 레포지토리는 2025년도 전국기능경기대회 클라우드컴퓨팅 직종에서 사용하는 bash profile, installation scripts 등의 Snippets 모음입니다.

## 전략
day1, day2, day3 Terraform 프로젝트가 각 레포지토리에 업로드되어 있습니다.  
Default VPC에 t3.micro 등 작은 bastion host를 생성한 후, 해당 Project를 Clone 받아 사용합니다.  
단, Clone 받은 프로젝트를 Apply하기 전, instance_setup/ps_instance.sh 파일을 실행합니다.  

## 포함한 파일들
### bash_profile
- Alias

### installations
- ArgoCD CLI
- Argo Rollouts CLI
- AWSCLI v2
- Kubectl
- eksctl
- Terraform