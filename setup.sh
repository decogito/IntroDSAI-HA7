#!/bin/bash
set -e

# 1. Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# 2. Activate uv (add to current shell PATH)
export PATH="$HOME/.local/bin:$PATH"

# 3. Install Python 3.13, init if needed, then ensure all packages are present
uv python install 3.13
if [ -f pyproject.toml ]; then
    echo "pyproject.toml found, skipping init..."
else
    uv init --python 3.13 .
fi

# 4. Ensure all required packages are installed
uv add chromadb langchain langchain-chroma langchain-community langchain-core langchain-huggingface langchain-ollama matplotlib pypdf sentence-transformers jupyter

# 5. Create Jupyter kernel named introdsai-ha7
uv run python -m ipykernel install --user --name introdsai-ha7 --display-name "introdsai-ha7"

echo "Setup complete. Kernel 'introdsai-ha7' is created."
