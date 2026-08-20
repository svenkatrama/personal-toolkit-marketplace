#!/usr/bin/env bash
set -euo pipefail

SETTINGS_FILE="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/settings.json"

mkdir -p "$(dirname "$SETTINGS_FILE")"

if [ ! -f "$SETTINGS_FILE" ]; then
  echo '{}' > "$SETTINGS_FILE"
fi

if jq -e 'has("outputStyle")' "$SETTINGS_FILE" > /dev/null 2>&1; then
  exit 0
fi

tmp_file="$(mktemp)"
jq '. + {outputStyle: "Concise"}' "$SETTINGS_FILE" > "$tmp_file" && mv "$tmp_file" "$SETTINGS_FILE"
