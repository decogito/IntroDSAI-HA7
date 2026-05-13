#!/bin/bash
set -e

# 1. Remove the Jupyter kernel
jupyter kernelspec remove introdsai-ha7 -y 2>/dev/null || true

# 2. Remove the local uv-managed virtual environment and project files
rm -rf .venv .python-version uv.lock

# 3. Uninstall uv (remove binaries per official docs)
rm -f "$HOME/.local/bin/uv" "$HOME/.local/bin/uvx"

echo "Uninstall complete. uv and the local environment have been removed."
