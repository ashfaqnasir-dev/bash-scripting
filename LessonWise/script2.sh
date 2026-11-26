#!/bin/bash
# Lesson 2: Variables aur User Input

# ---- Variable declare karna ----
naam="Ali"
umar=25
city="Lahore"

echo "Mera naam $naam hai"
echo "Meri umar $umar saal hai"
echo "Main $city se hoon"

# ---- User se input lena ----
echo ""
read -p "Aapka naam kya hai? " user_name
read -p "Aap kis sheher se hain? " user_city

echo ""
echo "Khush aamdeed, $user_name!"
echo "Aap $user_city se hain — bohat khoob!"

# ---- Command substitution variable mein ----
aaj=$(date +%Y-%m-%d)
echo "Aaj ki tareekh: $aaj"
