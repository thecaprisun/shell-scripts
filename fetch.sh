#!/bin/bash
echo -e $USER@$(hostname)
echo -e "\e[31mOS:     \e[0m$(awk -F= 'NR==3 {gsub(/"/, "", $2); print $2}' /etc/os-release)"
echo -e "\e[31mWM:     \e[0m$(printenv | awk 'NR==6 {split($0, a, "="); print a[2]}')"
echo -e "\e[31mKernel: \e[0m$(uname -r)"
echo -e "\e[31mRAM:    \e[0m$(free -m | awk '/^Mem:/ {print $3"M/"$2"M"}')"
if command -v dpkg &> /dev/null; then
    echo -e"P\e[31mPkgs:   \e[0m$(dpkg -l | grep '^ii' | wc -l)"
elif command -v rpm &> /dev/null; then
    echo -e "\e[31mPkgs:   \e[0m$(rpm -qa | wc -l)"
elif command -v pacman &> /dev/null; then
    echo -e "\e[31mPkgs:   \e[0m$(pacman -Q | wc -l)"
elif command -v dnf &> /dev/null; then
    echo -e "\e[31mPkgs:   \e[0m$(dnf list installed | grep -v '^Last metadata expiration check:' | wc -l)"
elif command -v zypper &> /dev/null; then
    echo -e "\e[31mPkgs:   \e[0m$(zypper se --installed-only | grep -E '^[il] ' | wc -l)"
elif command -v xbps-query &> /dev/null; then
    echo -e "\e[31mPkgs:   \e[0m$(xbps-query -l | wc -l)"
else
    echo
fi

