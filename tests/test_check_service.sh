
#!/bin/bash

LOG_FILE="logs/service.log"
SCRIPT="check_service.sh"

SERVICE_OK="ssh"  # Utilise un service fiable pour GitHub Actions

# Nettoyage log
> $LOG_FILE

# Test 1 : service existant
echo "➡️ Test 1 : Service actif ($SERVICE_OK)"
./$SCRIPT $SERVICE_OK

if grep -q "actif" "$LOG_FILE"; then
  echo "✅ Test 1 OK"
else
  echo "❌ Test 1 ÉCHOUÉ"
  exit 1
fi
