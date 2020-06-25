#!/usr/bin/env bash

set -euo pipefail

if [[ ! $# -eq 1 ]]; then
  echo "Usage: ${0} <env>" 1>&2
  echo "Usage: ${0} prod1" 1>&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
ENV_DIR="${SCRIPT_DIR}/envs/${1}"

if [[ ! -d "${ENV_DIR}" ]]; then
  echo "Invalid environment: ${1}" 1>&2
  exit 1
fi

(cd "${ENV_DIR}"; kustomize build . | kubectl apply -f -)