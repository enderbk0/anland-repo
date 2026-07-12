#!/data/data/com.termux/files/usr/bin/bash
# Anland Termux Repository Installer
set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
BOLD='\033[1m'
NC='\033[0m' # No Color

echo -e "${CYAN}${BOLD}=================================================="
echo -e "       Anland Patched APT Repository Installer    "
echo -e "==================================================${NC}"
echo -e "This script will configure the official Termux X11 repository,"
echo -e "add the Anland repository, perform a system upgrade, and install"
echo -e "Plasma Mobile with all required bugfixes.\n"

# 1. Install x11-repo
echo -e "${BLUE}[*] Installing official Termux x11-repo...${NC}"
pkg install -y x11-repo

# 2. Add Anland repository
echo -e "${BLUE}[*] Adding Anland repository to sources.list.d...${NC}"
REPO_LINE="deb [trusted=yes] https://enderbk.is-cool.dev/anland-repo stable main"
REPO_FILE="$PREFIX/etc/apt/sources.list.d/anland.list"

mkdir -p "$(dirname "$REPO_FILE")"
echo "$REPO_LINE" > "$REPO_FILE"
echo -e "${GREEN}[+] Repository added successfully at $REPO_FILE!${NC}"

# 3. Update and Upgrade packages
echo -e "${BLUE}[*] Running pkg update and pkg upgrade...${NC}"
pkg update -y
pkg upgrade -y

# 4. Install Plasma Mobile, Keyboard, and Settings
echo -e "${BLUE}[*] Installing Plasma Mobile, Keyboard, and Settings...${NC}"
pkg install -y plasma-mobile plasma-keyboard plasma-settings

echo -e "\n${GREEN}${BOLD}=================================================="
echo -e "            Installation Complete!               "
echo -e "==================================================${NC}"
echo -e "You can now start the Plasma Mobile session using:"
echo -e "  ${YELLOW}startplasmamobile --anland${NC}\n"
