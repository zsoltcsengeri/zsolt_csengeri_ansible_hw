#!/bin/bash
set -euo pipefail 

# Install EPEL repository (required for Ansible on Alma/Rocky)
dnf -y install epel-release || true

# Install Ansible and Git
dnf -y install ansible git

# Set hostname for clarity
hostnamectl set-hostname ansible
