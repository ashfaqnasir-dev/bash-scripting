# Automated Linux Control & Bash Scripting with n8n Nod

A practical, low-token agentic workflow combining **n8n Nod (WSL2)**, **OpenRouter Free Models (`LiquidAI: LFM3-1.7B`)**, **WhatsApp remote triggers**, and modular **Bash scripts** to automate local Linux system monitoring, task logging, and backup rotation.

---

## Architecture & Environment

- **Agent Runtime:** n8n Nod running on Windows Subsystem for Linux (`WSL2`)
- **Workspace Directory:** `/workspace/09fc78fb-681f-4b38-9b1e-fa8b1ea82684`
- **LLM Provider:** OpenRouter (`liquid/lfm3-1.7b:free`) — selected for fast, lightweight tool/terminal calling
- **Remote Interface:** WhatsApp Channel (`Linked Devices`) for mobile command execution
- **Automation Schedule:** Daily recurring check at `21:00 PKT (Asia/Karachi)`

---

## Exercises & Scripts Overview

### Exercise 1: Environment Verification & System Health Check (`system_check.sh`)
**Goal:** Verify terminal tool-calling connectivity between the LLM and the WSL Linux environment, connect WhatsApp, and execute a basic diagnostic script.

**`system_check.sh`**
```bash
#!/bin/bash

echo "=== System Health Report ==="
echo "Hostname: \$(hostname)"
echo "Uptime: \$(uptime -p)"
echo "Disk Space:"
df -h /
echo "Current Date: \$(date)"