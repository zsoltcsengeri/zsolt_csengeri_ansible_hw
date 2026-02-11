
#!/bin/bash
set -euo pipefail # Exit on error, undefined variable, or error in pipeline
echo "Working directory: $(pwd)"
echo "Clone/pull repo in current dir"
# Example: clone repo if missing, otherwise pull
if [ ! -d "zsolt_csengeri_ansible_hw/.git" ]; then
  git clone https://github.com/zsoltcsengeri/zsolt_csengeri_ansible_hw.git zsolt_csengeri_ansible_hw
else
  git -C zsolt_csengeri_ansible_hw pull
fi

