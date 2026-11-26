#!/bin/bash
# Lesson 4: Loops (for aur while)

# ---- 1. Simple for loop (numbers) ----
echo "=== 1 se 5 tak ginti ==="
for i in 1 2 3 4 5; do
    echo "Number: $i"
done

echo ""

# ---- 2. for loop with range {start..end} ----
echo "=== 1 se 10 tak (range) ==="
for i in {1..10}; do
    echo -n "$i "
done
echo ""

echo ""

# ---- 3. for loop over list (items) ----
echo "=== Phal ke naam ==="
for phal in aam kela seb santra; do
    echo "Phal: $phal"
done

echo ""

# ---- 4. while loop (jab tak condition true) ----
echo "=== Countdown ==="
count=5
while [ "$count" -gt 0 ]; do
    echo "Baqi hai: $count"
    count=$((count - 1))
done
echo "🚀 Launch!"
