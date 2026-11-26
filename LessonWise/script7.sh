#!/bin/bash
# Lesson 7: Text Processing - Real Linux Kaam

echo "===== 1. grep: Text mein dhondna ====="
# /etc/passwd se sirf bash users nikaalein
echo "--- Bash users ---"
grep "bash$" /etc/passwd | cut -d: -f1

echo ""

# ---- 2. cut: Columns nikaalna ----
echo "===== 2. cut: /etc/passwd se username aur shell ====="
cut -d: -f1,7 /etc/passwd | head -5

echo ""

# ---- 3. awk: Fields par kaam ----
echo "===== 3. awk: Disk usage (root partition) ====="
df -h / | awk 'NR==2 {print "Total: "$2, "Used: "$3, "Free: "$4}'

echo ""

# ---- 4. sed: Text replace karna ----
echo "===== 4. sed: Text replace ====="
echo "Mera naam Ali hai" | sed 's/Ali/Ahmed/'

echo ""

# ---- 5. sort + uniq: Count karna ----
echo "===== 5. Log file se unique IPs ====="
# Misaal ke liye ek fake log banate hain
cat > /tmp/test.log << EOF
192.168.1.1 GET /index.html
192.168.1.2 GET /about.html
192.168.1.1 POST /login
10.0.0.5 GET /index.html
192.168.1.2 GET /contact.html
EOF

echo "--- Unique IPs ---"
awk '{print $1}' /tmp/test.log | sort | uniq -c | sort -rn

echo ""

# ---- 6. Real kaam: Service status check ----
echo "===== 6. Service check ====="
check_service() {
    local svc="$1"
    if systemctl is-active --quiet "$svc" 2>/dev/null; then
        echo "✅ $svc: RUNNING"
    else
        echo "❌ $svc: NOT RUNNING"
    fi
}

check_service sshd
check_service crond

echo ""

# ---- 7. Real kaam: Disk space alert ----
echo "===== 7. Disk space alert ====="
usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
echo "Root partition usage: ${usage}%"

if [ "$usage" -gt 80 ]; then
    echo "⚠️  WARNING: Disk 80% se zyada bhar gaya hai!"
else
    echo "✅ Disk space theek hai"
fi#!/bin/bash
# Lesson 7: Text Processing - Real Linux Kaam

echo "===== 1. grep: Text mein dhondna ====="
# /etc/passwd se sirf bash users nikaalein
echo "--- Bash users ---"
grep "bash$" /etc/passwd | cut -d: -f1

echo ""

# ---- 2. cut: Columns nikaalna ----
echo "===== 2. cut: /etc/passwd se username aur shell ====="
cut -d: -f1,7 /etc/passwd | head -5

echo ""

# ---- 3. awk: Fields par kaam ----
echo "===== 3. awk: Disk usage (root partition) ====="
df -h / | awk 'NR==2 {print "Total: "$2, "Used: "$3, "Free: "$4}'

echo ""

# ---- 4. sed: Text replace karna ----
echo "===== 4. sed: Text replace ====="
echo "Mera naam Ali hai" | sed 's/Ali/Ahmed/'

echo ""

# ---- 5. sort + uniq: Count karna ----
echo "===== 5. Log file se unique IPs ====="
# Misaal ke liye ek fake log banate hain
cat > /tmp/test.log << EOF
192.168.1.1 GET /index.html
192.168.1.2 GET /about.html
192.168.1.1 POST /login
10.0.0.5 GET /index.html
192.168.1.2 GET /contact.html
EOF

echo "--- Unique IPs ---"
awk '{print $1}' /tmp/test.log | sort | uniq -c | sort -rn

echo ""

# ---- 6. Real kaam: Service status check ----
echo "===== 6. Service check ====="
check_service() {
    local svc="$1"
    if systemctl is-active --quiet "$svc" 2>/dev/null; then
        echo "✅ $svc: RUNNING"
    else
        echo "❌ $svc: NOT RUNNING"
    fi
}

check_service sshd
check_service crond

echo ""

# ---- 7. Real kaam: Disk space alert ----
echo "===== 7. Disk space alert ====="
usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
echo "Root partition usage: ${usage}%"

if [ "$usage" -gt 80 ]; then
    echo "⚠️  WARNING: Disk 80% se zyada bhar gaya hai!"
else
    echo "✅ Disk space theek hai"
fi
