#!/bin/bash

# Set backup target directory
BACKUP_DIR="$HOME/kde_backup_$(date +%Y-%m-%d_%H-%M-%S)"
mkdir -p "$BACKUP_DIR/.config"
mkdir -p "$BACKUP_DIR/.local/share"

echo "📦 Starting KDE config backup to: $BACKUP_DIR"

# -----------------------
# ✅ KDE Plasma Core Configs
# -----------------------

KDE_CONFIG_ITEMS=(
    "kdeglobals"
    "kwinrc"
    "kwinrulesrc"
    "kglobalshortcutsrc"
    "plasma-org.kde.plasma.desktop-appletsrc"
    "plasmashellrc"
    "ksplashrc"
    "ksmserverrc"
    "plasmarc"
    "kscreenlockerrc"
    "kaccessrc"
    "ktrashrc"
    "kmenueditrc"
    "klipperrc"
    "kwalletrc"
    "kcminputrc"
    "kcmfonts"
    "kxkbrc"
    "powermanagementprofilesrc"
    "powerdevilrc"
)

KDE_CONFIG_DIRS=(
    "autostart"
    "plasma-workspace"
    "kdeconnect"
)

# Copy KDE config files
for item in "${KDE_CONFIG_ITEMS[@]}"; do
    if [ -f "$HOME/.config/$item" ]; then
        cp "$HOME/.config/$item" "$BACKUP_DIR/.config/"
        echo "✔️ Backed up: $item"
    fi
done

# Copy KDE config directories
for dir in "${KDE_CONFIG_DIRS[@]}"; do
    if [ -d "$HOME/.config/$dir" ]; then
        cp -r "$HOME/.config/$dir" "$BACKUP_DIR/.config/"
        echo "✔️ Backed up dir: $dir/"
    fi
done

# -----------------------
# ⚙️ Optional CLI/Shell Tools
# -----------------------

OPTIONAL_CONFIGS=(
    "neofetch"
    "nvim"
    "ranger"
    "tmux"
    "bash"
    "synth-shell"
    "touchegg"
)

for cfg in "${OPTIONAL_CONFIGS[@]}"; do
    if [ -d "$HOME/.config/$cfg" ]; then
        cp -r "$HOME/.config/$cfg" "$BACKUP_DIR/.config/"
        echo "✔️ Backed up optional: $cfg/"
    fi
done

# Extra dotfiles
[ -f "$HOME/.config/starship.toml" ] && cp "$HOME/.config/starship.toml" "$BACKUP_DIR/.config/" && echo "✔️ Backed up: starship.toml"
[ -f "$HOME/.config/telegramdesktoprc" ] && cp "$HOME/.config/telegramdesktoprc" "$BACKUP_DIR/.config/" && echo "✔️ Backed up: telegramdesktoprc"

# -----------------------
# 🌐 Firefox
# -----------------------

FIREFOX_PROFILE_PATH="$HOME/.mozilla"
if [ -d "$FIREFOX_PROFILE_PATH" ]; then
    cp -r "$FIREFOX_PROFILE_PATH" "$BACKUP_DIR/"
    echo "✔️ Backed up: Firefox profile (.mozilla/)"
fi

# -----------------------
# 🔚 Done
# -----------------------

echo "✅ KDE + custom config backup completed at:"
echo "$BACKUP_DIR"

