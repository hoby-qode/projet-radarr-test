#!/bin/sh

TOKEN_FILE="/config/token.json"

if [ ! -f "$TOKEN_FILE" ]; then
  echo "Token manquant. Veuillez ajouter token.json dans ./config/"
  exit 1
fi

EXPIRY=$(jq -r '.expiresAt' "$TOKEN_FILE")
NOW=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

if [ "$NOW" \> "$EXPIRY" ]; then
  echo "Token expiré. Veuillez le renouveler"
  exit 1
fi

echo "Token valide. Lancement de Radarr..."
exec /init
