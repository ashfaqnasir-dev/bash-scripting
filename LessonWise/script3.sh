#!/bin/bash
# Lesson 3: Conditions (if / elif / else)

# ---- 1. Simple if ----
read -p "Aapki umar kitni hai? " umar

if [ "$umar" -ge 18 ]; then
    echo "Aap adult hain — vote de sakte hain."
else
    echo "Aap abhi minor hain — vote nahi de sakte."
fi

echo ""

# ---- 2. if / elif / else (multiple conditions) ----
read -p "Number daalein (1-100): " num

if [ "$num" -gt 50 ]; then
    echo "Number 50 se bara hai"
elif [ "$num" -eq 50 ]; then
    echo "Number bilkul 50 hai"
else
    echo "Number 50 se chhota hai"
fi

echo ""

# ---- 3. String comparison ----
read -p "Password daalein: " pass

if [ "$pass" = "pakistan123" ]; then
    echo "✅ Sahi password — access granted"
else
    echo "❌ Ghalat password — access denied"
fi

echo ""

# ---- 4. File check ----
read -p "Koi file ka naam likhein: " file

if [ -f "$file" ]; then
    echo "✅ File '$file' mojood hai"
else
    echo "❌ File '$file' nahi mili"
fi
