#!/bin/bash
# This script clones the Ansible playbook repository if it doesn't exist, or pulls the latest changes if it does.

set -euo pipefail # Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails.

REPO_URL="https://github.com/zsoltcsengeri/zsolt_csengeri_ansible_hw.git" # The URL of the Git repository to clone or pull from.
REPO_DIR="zsolt_csengeri_ansible_hw" # The directory where the repository will be cloned or pulled. This should match the name of the repository.

echo "Working directory: $(pwd)" # Print the current working directory to the console for debugging purposes.

if [ -d "${REPO_DIR}/.git" ]; then # Check if the .git directory exists in the specified repository directory, which indicates that the repository has already been cloned.
  echo "Repo already exists -> pulling latest changes..." # If the repository already exists, print a message indicating that we will pull the latest changes.
  git -C "${REPO_DIR}" pull origin main # Pull the latest changes from the 'main' branch of the remote repository into the local repository.
else
  echo "Cloning repo into ./${REPO_DIR} ..." # If the repository does not exist, print a message indicating that we will clone the repository.
  git clone "${REPO_URL}" "${REPO_DIR}" # Clone the repository from the specified URL into the specified directory.
fi

echo "Latest commit:" # Print a message indicating that we will display the latest commit in the repository.
git -C "${REPO_DIR}" log -1 --oneline # Display the latest commit in the repository in a concise format (one line per commit) for easy reading.

echo # Print an empty line for better readability in the console output.
echo "Next:" # Print a message indicating the next steps to run the Ansible playbook.
echo "  cd ${REPO_DIR}" # Print a message indicating that the user should change into the repository directory to run the Ansible playbook.
echo "  ansible-playbook -i /shared/inventory ./nginx_install.yml" # Print a message indicating the command to run the Ansible playbook, specifying the inventory file and the playbook file.

