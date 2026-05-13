# Run with: powershell -ExecutionPolicy Bypass -File setup.ps1
$ErrorActionPreference = "Stop"

# 1. Install uv
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"

# 2. Activate uv (add to current session PATH)
$env:PATH = "$env:USERPROFILE\.local\bin;$env:PATH"

# 3. Init current folder and pin Python 3.13
uv init --python 3.13 .

# 4. Add required packages
uv add chromadb langchain langchain-chroma langchain-community langchain-core langchain-huggingface langchain-ollama matplotlib pypdf sentence-transformers jupyter

# 5. Create Jupyter kernel named introdsai-ha7
uv run python -m ipykernel install --user --name introdsai-ha7 --display-name "introdsai-ha7"

Write-Host "Setup complete. Kernel 'introdsai-ha7' is created."
