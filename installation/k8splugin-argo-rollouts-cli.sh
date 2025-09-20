### ----------------------------------------
### Argo Rollouts CLI Installation with K8s Plugin Script
### Updated @ 2025-09-20
### Reference: https://argo-rollouts.readthedocs.io/en/stable/installation/
### ----------------------------------------

curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64
chmod +x ./kubectl-argo-rollouts-linux-amd64
sudo mv ./kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts

kubectl argo rollouts version
