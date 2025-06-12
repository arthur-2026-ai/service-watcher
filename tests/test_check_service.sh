#!/bin/bash

LOG_FILE="logs/service.log"
SCRIPT="check_service.sh"
SERVICE_OK="ssh"

# 🛠 Créer le dossier logs s’il n’existe pas
mkdir -p logs

# 🔄 Nettoyage du log précédent
> "$LOG_FILE"

# ➡️ Test 1 : service existant
echo "➡️ Test 1 : Service actif ($SERVICE_OK)"
../$SCRIPT $SERVICE_OK

# ✅ Vérification du log
if grep -q "actif" "$LOG_FILE"; then
  echo "✅ Test 1 OK"
else
  echo "❌ Test 1 ÉCHOUÉ"
  exit 1
fi
