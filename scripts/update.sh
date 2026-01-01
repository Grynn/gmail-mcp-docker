#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
ENV_FILE="$ROOT_DIR/.env"

if ! command -v docker >/dev/null 2>&1; then
  echo "Error: docker is not installed." >&2
  exit 1
fi

if ! command -v docker-compose >/dev/null 2>&1 && ! docker compose version >/dev/null 2>&1; then
  echo "Error: docker compose is not available." >&2
  exit 1
fi

if [ ! -f "$ENV_FILE" ]; then
  echo "Error: .env not found at $ENV_FILE (copy .env.example)." >&2
  exit 1
fi

cd "$ROOT_DIR"

docker compose --env-file "$ENV_FILE" build --pull

docker compose --env-file "$ENV_FILE" up -d

echo "Update complete."
