#!/bin/bash
# Lesson 5: Functions

# ---- 1. Simple function (koi argument nahi) ----
salam() {
    echo "Assalam-o-Alaikum!"
}

# Function ko call karna
salam
salam

echo ""

# ---- 2. Function with arguments ----
greet() {
    echo "Salam, $1! Aap $2 se hain."
}

greet "Ali" "Lahore"
greet "Ahmed" "Karachi"

echo ""

# ---- 3. Function with return value (echo se) ----
jama() {
    local sum=$(( $1 + $2 ))
    echo "$sum"
}

result=$(jama 10 25)
echo "10 + 25 = $result"

echo ""

# ---- 4. Function jo kaam karta hai ----
check_file() {
    if [ -f "$1" ]; then
        echo "✅ '$1' mojood hai"
    else
        echo "❌ '$1' nahi mili"
    fi
}

check_file "script5.sh"
check_file "ghalat.txt"
