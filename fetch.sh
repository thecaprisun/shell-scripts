#!/bin/bash
echo -e "$USER@$(hostname)"
echo -e "\e[31mOS:     \e[0m$(. /etc/os-release;echo $PRETTY_NAME)"
echo -e "\e[31mWM:     \e[0m$(echo $XDG_CURRENT_DESKTOP)"
echo -e "\e[31mKernel: \e[0m$(uname -r)"
echo -e "\e[31mRAM:    \e[0m$(free -m | awk '/^Mem:/ {print $3"M/"$2"M"}')"
pkg_details=""
append_pkg_details() {
    local manager=$1
    local count=$2
    if [ -z "$pkg_details" ]; then
        pkg_details="$count ($manager)"
    else
        pkg_details="$pkg_details, $count ($manager)"
    fi
}
if command -v dpkg &> /dev/null; then
    dpkg_count=$(dpkg -l | grep '^ii' | wc -l)
    append_pkg_details "dpkg" "$dpkg_count"
fi
if command -v rpm &> /dev/null; then
    rpm_count=$(rpm -qa | wc -l)
    append_pkg_details "rpm" "$rpm_count"
fi
if command -v pacman &> /dev/null; then
    pacman_count=$(pacman -Q | wc -l)
    append_pkg_details "pacman" "$pacman_count"
fi
if command -v dnf &> /dev/null; then
    dnf_count=$(dnf list installed | grep -v '^Last metadata expiration check:' | wc -l)
    append_pkg_details "dnf" "$dnf_count"
fi
if command -v zypper &> /dev/null; then
    zypper_count=$(zypper se --installed-only | grep -E '^[il] ' | wc -l)
    append_pkg_details "zypper" "$zypper_count"
fi
if command -v xbps-query &> /dev/null; then
    xbps_count=$(xbps-query -l | wc -l)
    append_pkg_details "xbps" "$xbps_count"
fi
if command -v flatpak &> /dev/null; then
    flatpak_count=$(flatpak list | wc -l)
    [ "$flatpak_count" -gt 0 ] && append_pkg_details "flatpak" "$flatpak_count"
fi
if command -v snap &> /dev/null; then
    snap_count=$(snap list | wc -l)
    [ "$snap_count" -gt 0 ] && append_pkg_details "snap" "$snap_count"
fi
echo -e "\e[31mPkgs:   \e[0m$pkg_details"
echo -e "\e[31mDisk:   \e[0m$(df -h / | awk 'NR==2 {print $3 "B / " $2 "B"}')"
