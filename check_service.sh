#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage : $0 nom_du_service"
    exit 1
fi

SERVICE=$1
LOG_DIR="logs"
LOG_FILE="$LOG_DIR/service.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

mkdir -p "$LOG_DIR"

if systemctl is-active --quiet "$SERVICE"; then
    echo "$DATE : ✅ Le service '$SERVICE' est actif." >> "$LOG_FILE"
else
    echo "$DATE : ❌ Le service '$SERVICE' est INACTIF ou introuvable!" >> "$LOG_FILE"
fi
