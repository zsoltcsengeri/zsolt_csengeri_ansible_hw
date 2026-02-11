#!/bin/bash 
# This script clones the nginx_install.yml playbook from the git repository to the /shared directory, which is shared between the host and the VM.
cd /shared/inventory # change to the inventory directory where the playbook will be cloned
git clone https://github.com/zsoltcsengeri/zsolt_csengeri_ansible_hw.git # clone the repository containing the ansible playbook to the shared directory
git -C zsolt_csengeri_ansible_hw pull origin main # pull the latest changes from the main branch to ensure that the playbook is up to date
git -C zsolt_csengeri_ansible_hw log -1 --oneline # display the latest commit in the repository to verify that the playbook has been successfully cloned and updated


