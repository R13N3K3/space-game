#!/usr/bin/env bash
# Erkennt den Paketmanager (apt oder pacman), installiert fehlende
# Systempakete und ruft danach install.sh auf (venv + pygame-ce + Alias).
set -e

GAME_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Space Game Setup"

if command -v apt-get >/dev/null 2>&1; then
    PM="apt"
    PACKAGES=(python3 python3-venv python3-pip)
elif command -v pacman >/dev/null 2>&1; then
    PM="pacman"
    PACKAGES=(python python-pip)
else
    echo "Fehler: weder apt noch pacman gefunden." >&2
    echo "Installiere python3 (mit venv und pip) manuell und starte dann: bash install.sh" >&2
    exit 1
fi
echo "    Paketmanager: $PM"

# nur nachinstallieren, was fehlt
need_install=0
command -v python3 >/dev/null 2>&1 || need_install=1
python3 -c "import venv, ensurepip" >/dev/null 2>&1 || need_install=1

if [ "$need_install" -eq 1 ]; then
    SUDO=""
    [ "$(id -u)" -ne 0 ] && SUDO="sudo"
    echo "==> Installiere Systempakete: ${PACKAGES[*]}"
    case "$PM" in
        apt)
            $SUDO apt-get update
            $SUDO apt-get install -y "${PACKAGES[@]}"
            ;;
        pacman)
            $SUDO pacman -S --needed --noconfirm "${PACKAGES[@]}"
            ;;
    esac
else
    echo "==> Python 3 mit venv ist bereits vorhanden."
fi

bash "$GAME_DIR/install.sh"
