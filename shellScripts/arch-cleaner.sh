#!/usr/bin/env bash

LOGFILE="/var/log/arch-cleaner.log"
exec > >(sudo tee -a "$LOGFILE") 2>&1

echo "========================================="
echo " Arch System Cleanup Tool"
echo " Date: $(date)"
echo "========================================="
echo

confirm() {
    read -rp "$1 [y/N]: " response
    [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
}

echo "Disk usage BEFORE cleanup:"
df -h /
echo

############################################
# Pacman Cache
############################################
echo "Pacman cache size:"
sudo du -sh /var/cache/pacman/pkg/ 2>/dev/null || true
echo

if confirm "Clean old pacman cache (keep last 1 version)?"; then
    sudo paccache -rk1
fi

############################################
# Orphan Packages
############################################
orphans=$(pacman -Qtdq || true)

if [[ -n "$orphans" ]]; then
    echo "Orphan packages found:"
    echo "$orphans"
    if confirm "Remove orphan packages?"; then
        sudo pacman -Rns $orphans
    fi
else
    echo "No orphan packages."
fi

############################################
# Journal Cleanup
############################################
journalctl --disk-usage
if confirm "Limit journal logs to last 7 days?"; then
    sudo journalctl --vacuum-time=7d
fi

############################################
# Flatpak Cleanup
############################################
if command -v flatpak >/dev/null 2>&1; then
    echo
    echo "Flatpak detected."
    if confirm "Remove unused Flatpak runtimes?"; then
        flatpak uninstall --unused
    fi
fi

############################################
# Yay Cache Cleanup
############################################
if command -v yay >/dev/null 2>&1; then
    echo
    echo "Yay cache size:"
    du -sh ~/.cache/yay 2>/dev/null || true
    if confirm "Clean yay cache?"; then
        yay -Sc --noconfirm
    fi
fi

############################################
# Pip Cache Cleanup
############################################
if command -v pip >/dev/null 2>&1; then
    echo
    echo "Pip cache size:"
    pip cache dir 2>/dev/null | xargs du -sh 2>/dev/null || true
    if confirm "Clean pip cache?"; then
        pip cache purge
    fi
fi

############################################
# NPM Cache Cleanup
############################################
if command -v npm >/dev/null 2>&1; then
    echo
    echo "NPM cache size:"
    npm cache verify 2>/dev/null
    if confirm "Clean npm cache?"; then
        npm cache clean --force
    fi
fi

############################################
# User Cache Cleanup
############################################
echo
echo "User cache size:"
du -sh ~/.cache 2>/dev/null || true
if confirm "Delete ALL contents of ~/.cache ?"; then
    rm -rf ~/.cache/*
fi

############################################
# ncdu Summary
############################################
if command -v ncdu >/dev/null 2>&1; then
    if confirm "Launch ncdu disk analyzer?"; then
        sudo ncdu /
    fi
else
    echo "ncdu not installed. Install with: sudo pacman -S ncdu"
fi

echo
echo "Disk usage AFTER cleanup:"
df -h /

echo
echo "Cleanup completed successfully."
echo "Log saved to $LOGFILE"
