#!/bin/bash

set -e

echo "🚀 Starting Arch Dev Setup..."

bash scripts/install-packages.sh
bash scripts/clone-repos.sh
bash scripts/symlink.sh
bash scripts/post-install.sh

echo "=== All done! Enjoy your setup ==="
