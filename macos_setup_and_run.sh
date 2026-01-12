#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_PATH="$REPO_ROOT/.venv"
ENV_FILE="$REPO_ROOT/.env"
ENV_EXAMPLE="$REPO_ROOT/.env.example"
NOTEBOOK_PATH="$REPO_ROOT/notebooks/pagerduty-usage-cost-report.ipynb"

if [[ ! -d "$VENV_PATH" ]]; then
  python3 -m venv "$VENV_PATH"
fi

# shellcheck disable=SC1091
source "$VENV_PATH/bin/activate"

pip install --upgrade pip
pip install -r "$REPO_ROOT/requirements.txt"

if [[ ! -f "$ENV_FILE" ]]; then
  cp "$ENV_EXAMPLE" "$ENV_FILE"
fi

read -r -p "Enter your PagerDuty API token: " PAGERDUTY_API_TOKEN

if [[ -z "$PAGERDUTY_API_TOKEN" ]]; then
  echo "PagerDuty API token cannot be empty."
  exit 1
fi

TOKEN_ESCAPED="$PAGERDUTY_API_TOKEN"
TOKEN_ESCAPED="${TOKEN_ESCAPED//\\/\\\\}"
TOKEN_ESCAPED="${TOKEN_ESCAPED//&/\\&}"
TOKEN_ESCAPED="${TOKEN_ESCAPED//\//\\/}"

if grep -q '^PAGERDUTY_API_TOKEN=' "$ENV_FILE"; then
  sed -i '' "s/^PAGERDUTY_API_TOKEN=.*/PAGERDUTY_API_TOKEN=${TOKEN_ESCAPED}/" "$ENV_FILE"
else
  printf '\nPAGERDUTY_API_TOKEN=%s\n' "$PAGERDUTY_API_TOKEN" >> "$ENV_FILE"
fi

if ! command -v code >/dev/null 2>&1; then
  echo "VS Code command 'code' not found. Install VS Code and enable the 'Shell Command: Install code command in PATH' option."
  exit 1
fi

echo "Opening the notebook in VS Code..."
code "$NOTEBOOK_PATH"
