# Run with: powershell -ExecutionPolicy Bypass -File uninstall.ps1
$ErrorActionPreference = "Stop"

# 1. Remove the Jupyter kernel
try {
    jupyter kernelspec remove introdsai-ha7 -y
} catch {
    Write-Host "Kernel 'introdsai-ha7' not found or already removed."
}

# 2. Remove the local uv-managed virtual environment and project files
$toRemove = @(".venv", ".python-version", "uv.lock")
foreach ($item in $toRemove) {
    if (Test-Path $item) {
        Remove-Item -Recurse -Force $item
    }
}

# 3. Uninstall uv (remove binaries per official docs)
$uvBins = @(
    "$env:USERPROFILE\.local\bin\uv.exe",
    "$env:USERPROFILE\.local\bin\uvx.exe"
)
foreach ($bin in $uvBins) {
    if (Test-Path $bin) {
        Remove-Item -Force $bin
    }
}

Write-Host "Uninstall complete. uv and the local environment have been removed."
