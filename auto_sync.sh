#!/bin/bash

# Configuration (Auto-detects H: or G: Google Drive mount)
if [ -d "/mnt/h/My Drive/dev/bash-scripting" ]; then
    REPO_DIR="/mnt/h/My Drive/dev/bash-scripting"
elif [ -d "/mnt/g/My Drive/dev/bash-scripting" ]; then
    REPO_DIR="/mnt/g/My Drive/dev/bash-scripting"
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: Neither /mnt/h nor /mnt/g Google Drive path found."
    exit 1
fi

LOG_FILE="$REPO_DIR/sync_alert.log"
WEBHOOK_URL="http://localhost:5678/webhook/system-alert"
DISK_THRESHOLD=80
MEM_THRESHOLD=85
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

cd "$REPO_DIR" || { echo "[$TIMESTAMP] ERROR: Cannot access $REPO_DIR" >> "$LOG_FILE"; exit 1; }

# 1. System Resource Monitoring (Disk & Memory)
DISK_USAGE=$(df / | awk 'NR==2 {gsub("%",""); print $5}')
MEM_USAGE=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')

ALERTS=""
if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
    ALERTS+="ALERT: Disk usage at ${DISK_USAGE}% (Threshold: ${DISK_THRESHOLD}%). "
fi

if [ "$MEM_USAGE" -ge "$MEM_THRESHOLD" ]; then
    ALERTS+="ALERT: Memory usage at ${MEM_USAGE}% (Threshold: ${MEM_THRESHOLD}%). "
fi

if [ -n "$ALERTS" ]; then
    echo "[$TIMESTAMP] $ALERTS" | tee -a "$LOG_FILE"
    curl -s -X POST "$WEBHOOK_URL" \
      -H "Content-Type: application/json" \
      -d "{\"host\":\"$(hostname)\",\"timestamp\":\"$TIMESTAMP\",\"disk\":\"${DISK_USAGE}%\",\"memory\":\"${MEM_USAGE}%\",\"alert\":\"$ALERTS\"}" >> "$LOG_FILE" 2>&1
else
    echo "[$TIMESTAMP] OK: Disk=${DISK_USAGE}%, Mem=${MEM_USAGE}%" >> "$LOG_FILE"
fi

# 2. Automated Git Sync (Stage, Commit, Pull --rebase, Push)
if [[ -n $(git status --porcelain) ]]; then
    git add .
    git commit -m "Auto-sync workspace updates [$TIMESTAMP]" >> "$LOG_FILE" 2>&1
    git pull --rebase origin main >> "$LOG_FILE" 2>&1
    if git push origin main >> "$LOG_FILE" 2>&1; then
        echo "[$TIMESTAMP] SYNC: Changes pushed to GitHub successfully." | tee -a "$LOG_FILE"
    else
        echo "[$TIMESTAMP] ERROR: Git push failed. Check SSH or network." | tee -a "$LOG_FILE"
    fi
else
    echo "[$TIMESTAMP] SYNC: Working tree clean. Nothing to push." >> "$LOG_FILE"
fi
