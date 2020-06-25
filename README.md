# Notejam Kubernetes

This repository is a GitOps store for the Notejam application.

## Prerequisites

Installed tools:
- Azure CLI >= 2.6.0
- kubectl >= 1.16.9
- helm >= 3.0.0
- kustomize >= 3.5.4

The following steps need to be done on both AKS clusters (aks1 and aks2)
- Get admin credentials `az aks get-credentials -g <resource_group> -n <aks_name> --admin`
- Install NGINX ingress controller (`./utils/nginx-ingress/deploy.sh <env> <instance>`)

## Deploy Notejam

- Run `./notejam/deploy.sh <env>`