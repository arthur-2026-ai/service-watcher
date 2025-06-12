
#!/bin/bash

# Toujours relatif à la racine du dépôt
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
LOG_FILE="$ROOT_DIR/logs/service.log"
SCRIPT="$ROOT_DIR/check_service.sh"
SERVICE_OK="ssh"

mkdir -p "$(dirname "$LOG_FILE")"
> "$LOG_FILE"

echo "➡️ Test 1 : Service actif ($SERVICE_OK)"
bash "$SCRIPT" $SERVICE_OK

if grep -q "actif" "$LOG_FILE"; then
  echo "✅ Test 1 OK"
else
  echo "❌ Test 1 ÉCHOUÉ"
  exit 1
fi
