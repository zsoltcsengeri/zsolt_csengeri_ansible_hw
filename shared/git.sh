#!/bin/bash
set -euo pipefail

REPO_URL="https://github.com/zsoltcsengeri/zsolt_csengeri_ansible_hw.git"
REPO_DIR="zsolt_csengeri_ansible_hw"

echo "Working directory: $(pwd)"

if [ -d "${REPO_DIR}/.git" ]; then
  echo "Repo already exists -> pulling latest changes..."
  git -C "${REPO_DIR}" pull origin main
else
  echo "Cloning repo into ./${REPO_DIR} ..."
  git clone "${REPO_URL}" "${REPO_DIR}"
fi

git -C "${REPO_DIR}" log -1 --oneline
