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
echo -e "This script will add the Anland repository and optionally"
echo -e "install Hyprland or Plasma Mobile for Termux.\n"

# 1. Add repository
echo -e "${BLUE}[*] Adding repository to sources.list.d...${NC}"
REPO_LINE="deb [trusted=yes] https://enderbk.is-cool.dev/anland-repo stable main"
REPO_FILE="$PREFIX/etc/apt/sources.list.d/anland.list"

# Create file or overwrite/append
mkdir -p "$(dirname "$REPO_FILE")"
echo "$REPO_LINE" > "$REPO_FILE"
echo -e "${GREEN}[+] Repository added successfully at $REPO_FILE!${NC}"

# 2. Update packages
echo -e "${BLUE}[*] Running pkg update...${NC}"
pkg update -y

echo -e "\n${CYAN}${BOLD}What would you like to install?${NC}"
echo -e "1) ${BOLD}Plasma Mobile${NC} (Shell, Keyboard, and Settings)"
echo -e "2) ${BOLD}Hyprland${NC} (Tiling Compositor & libraries)"
echo -e "3) ${BOLD}Both${NC}"
echo -e "4) ${BOLD}Exit${NC} (Just add repository)"

read -p "Choose an option [1-4]: " CHOICE

case "$CHOICE" in
    1)
        echo -e "${BLUE}[*] Installing Plasma Mobile, Keyboard, and Settings...${NC}"
        pkg install -y plasma-mobile plasma-keyboard plasma-settings
        echo -e "${GREEN}[+] Plasma Mobile installed successfully!${NC}"
        echo -e "${YELLOW}Tip: You can start the session with: startplasmamobile --anland${NC}"
        ;;
    2)
        echo -e "${BLUE}[*] Installing Hyprland...${NC}"
        pkg install -y hyprland
        echo -e "${GREEN}[+] Hyprland installed successfully!${NC}"
        ;;
    3)
        echo -e "${BLUE}[*] Installing Both...${NC}"
        pkg install -y plasma-mobile plasma-keyboard plasma-settings hyprland
        echo -e "${GREEN}[+] All packages installed successfully!${NC}"
        echo -e "${YELLOW}Tip: You can start the Plasma session with: startplasmamobile --anland${NC}"
        ;;
    *)
        echo -e "${GREEN}[+] Setup complete. Repository added.${NC}"
        ;;
esac
