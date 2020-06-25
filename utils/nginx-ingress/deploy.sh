#!/usr/bin/env bash

set -euo pipefail

if [[ ! $# -eq 2 ]]; then
  echo "Usage: ${0} <env> <instance>" 1>&2
  echo "Example: ${0} prod 1" 1>&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
VALUES_FILE_PATH="${SCRIPT_DIR}/values.${1}${2}.yaml"

if [[ ! -f "${VALUES_FILE_PATH}" ]]; then
  echo "Invalid env/instance pair. File ${VALUES_FILE_PATH} does not exist" 1>&2
  exit 1
fi

helm repo add stable https://kubernetes-charts.storage.googleapis.com/

helm upgrade --install \
  --namespace=ingress \
  --values "${VALUES_FILE_PATH}" \
  nginx-ingress stable/nginx-ingress