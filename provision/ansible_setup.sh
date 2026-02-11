#!/bin/bash
set -euo pipefail

# Install EPEL repository (required for Ansible on Alma/Rocky)
dnf -y install epel-release || true

# Install Ansible, Git, and sshpass (for password-based SSH in inventory)
dnf -y install ansible git sshpass

# Set hostname for clarity
hostnamectl set-hostname ansible
