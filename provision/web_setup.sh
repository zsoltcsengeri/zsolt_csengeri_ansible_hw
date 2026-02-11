#!/bin/bash
set -euo pipefail

# Create user for Ansible (idempotent)
id homework >/dev/null 2>&1 || useradd -m homework

# Set password
echo "homework:homework" | chpasswd

# Allow passwordless sudo
echo "homework ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/homework
chmod 440 /etc/sudoers.d/homework

# Set hostname for clarity
hostnamectl set-hostname web
