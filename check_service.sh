#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage : $0 nom_du_service"
    exit 1
fi

SERVICE=$1
LOG_FILE="logs/service.log"

mkdir -p logs

if systemctl is-active --quiet "$SERVICE"; then
  echo "Le service '$SERVICE' est actif." >> "$LOG_FILE"
else
  echo "Le service '$SERVICE' est INACTIF ou introuvable." >> "$LOG_FILE"
fi
