#!/bin/bash

SCRIPT="../check_service.sh"
LOG_FILE="../logs/service.log"

> "$LOG_FILE"

SERVICE_OK="cron"
$SCRIPT "$SERVICE_OK"

if grep -q "Le service '$SERVICE_OK' est actif" "$LOG_FILE"; then
    echo "✅ Test 1 OK"
else
    echo "❌ Test 1 ÉCHOUÉ"
    exit 1
fi

SERVICE_FAKE="fake_service_$$"
$SCRIPT "$SERVICE_FAKE"

if grep -q "INACTIF" "$LOG_FILE"; then
    echo "✅ Test 2 OK"
else
    echo "❌ Test 2 ÉCHOUÉ"
    exit 1
fi

echo "✅ Tous les tests sont passés."
