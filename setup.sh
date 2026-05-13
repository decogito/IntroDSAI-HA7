#!/bin/bash
set -e

# 1. Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# 2. Activate uv (add to current shell PATH)
export PATH="$HOME/.local/bin:$PATH"

# 3. Init current folder and pin Python 3.13
uv init --python 3.13 .

# 4. Add required packages
uv add chromadb langchain langchain-chroma langchain-community langchain-core langchain-huggingface langchain-ollama matplotlib pypdf sentence-transformers jupyter

# 5. Create Jupyter kernel named introdsai-ha7
uv run python -m ipykernel install --user --name introdsai-ha7 --display-name "introdsai-ha7"

echo "Setup complete. Kernel 'introdsai-ha7' is created."
