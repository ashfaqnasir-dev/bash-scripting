#!/bin/bash
# Lesson 6: Script Arguments + case statement

# ---- 1. Script arguments ----
echo "Script ka naam: $0"
echo "Total arguments: $#"
echo "Saare arguments: $@"
echo "Pehla argument: $1"
echo "Doosra argument: $2"

echo ""

# ---- 2. Argument check (agar argument na diya ho) ----
if [ $# -eq 0 ]; then
    echo "❌ Koi argument nahi diya!"
    echo "Istemaal: $0 {start|stop|status|restart}"
    exit 1
fi

# ---- 3. case statement ----
case "$1" in
    start)
        echo "🚀 Service START ho rahi hai..."
        ;;
    stop)
        echo "🛑 Service STOP ho rahi hai..."
        ;;
    restart)
        echo "🔄 Service RESTART ho rahi hai..."
        ;;
    status)
        echo "📊 Service ka status check ho raha hai..."
        ;;
    *)
        echo "❌ Ghalat command: $1"
        echo "Istemaal: $0 {start|stop|status|restart}"
        exit 1
        ;;
esac
