#!/bin/bash

LOG_FILE="logs/service.log"
SCRIPT="./check_service.sh"
SERVICE_OK="ssh"

# Crée le répertoire de log si nécessaire
mkdir -p logs
> "$LOG_FILE"

echo "➡️ Test 1 : Service actif ($SERVICE_OK)"
bash "$SCRIPT" $SERVICE_OK

if grep -q "actif" "$LOG_FILE"; then
  echo "✅ Test 1 OK"
else
  echo "❌ Test 1 ÉCHOUÉ"
  exit 1
fi
