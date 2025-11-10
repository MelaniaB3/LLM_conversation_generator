param()

# Windows PowerShell helper to initialize pre-commit and detect-secrets baseline
Write-Host "Installing pre-commit hooks and creating detect-secrets baseline..."

if (-not (Get-Command pre-commit -ErrorAction SilentlyContinue)) {
    Write-Host "pre-commit not found on PATH. Try: python -m pip install --user pre-commit detect-secrets" -ForegroundColor Yellow
    exit 1
}

pre-commit install

# run detect-secrets to create baseline (will prompt for exclusions for false positives)
detect-secrets scan > .secrets.baseline

Write-Host "Done. Review .secrets.baseline and commit it along with .pre-commit-config.yaml" -ForegroundColor Green
