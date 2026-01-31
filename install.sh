#!/bin/bash

# Claude Code for Everyone - Installer
# This script handles all the technical stuff so you don't have to.

set -e

# Colors for friendly output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ""
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}   Claude Code for Everyone Installer   ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Detect OS
detect_os() {
    case "$(uname -s)" in
        Darwin*)    OS="mac" ;;
        Linux*)     OS="linux" ;;
        MINGW*|MSYS*|CYGWIN*) OS="windows" ;;
        *)          OS="unknown" ;;
    esac
    echo "$OS"
}

OS=$(detect_os)
echo -e "${GREEN}✓${NC} Detected operating system: $OS"

# Check if Node.js is installed
check_node() {
    if command -v node &> /dev/null; then
        NODE_VERSION=$(node -v)
        echo -e "${GREEN}✓${NC} Node.js is already installed ($NODE_VERSION)"
        return 0
    else
        return 1
    fi
}

# Install Node.js based on OS
install_node() {
    echo -e "${YELLOW}→${NC} Installing Node.js (this may take a moment)..."

    case "$OS" in
        mac)
            if command -v brew &> /dev/null; then
                brew install node
            else
                echo -e "${YELLOW}→${NC} Installing Homebrew first..."
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
                brew install node
            fi
            ;;
        linux)
            if command -v apt-get &> /dev/null; then
                curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
                sudo apt-get install -y nodejs
            elif command -v dnf &> /dev/null; then
                sudo dnf install -y nodejs
            elif command -v pacman &> /dev/null; then
                sudo pacman -S nodejs npm
            else
                echo -e "${RED}✗${NC} Could not detect package manager. Please install Node.js manually from https://nodejs.org"
                exit 1
            fi
            ;;
        windows)
            echo -e "${YELLOW}!${NC} On Windows, please download Node.js from https://nodejs.org"
            echo "   Download the LTS version, run the installer, then run this script again."
            exit 1
            ;;
        *)
            echo -e "${RED}✗${NC} Unknown operating system. Please install Node.js manually from https://nodejs.org"
            exit 1
            ;;
    esac

    echo -e "${GREEN}✓${NC} Node.js installed successfully"
}

# Install Claude Code
install_claude_code() {
    echo -e "${YELLOW}→${NC} Installing Claude Code..."
    npm install -g @anthropic-ai/claude-code
    echo -e "${GREEN}✓${NC} Claude Code installed successfully"
}

# Create a simple launcher alias
create_launcher() {
    SHELL_RC=""
    if [ -f "$HOME/.zshrc" ]; then
        SHELL_RC="$HOME/.zshrc"
    elif [ -f "$HOME/.bashrc" ]; then
        SHELL_RC="$HOME/.bashrc"
    fi

    if [ -n "$SHELL_RC" ]; then
        if ! grep -q "alias ai=" "$SHELL_RC" 2>/dev/null; then
            echo "" >> "$SHELL_RC"
            echo "# Claude Code shortcut" >> "$SHELL_RC"
            echo "alias ai='claude'" >> "$SHELL_RC"
            echo -e "${GREEN}✓${NC} Created shortcut: you can now type 'ai' instead of 'claude'"
        fi
    fi
}

# Main installation flow
main() {
    # Step 1: Check/Install Node.js
    if ! check_node; then
        install_node
    fi

    # Step 2: Install Claude Code
    install_claude_code

    # Step 3: Create launcher shortcut
    create_launcher

    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}   Installation Complete!               ${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo "To start Claude Code, type:"
    echo ""
    echo -e "    ${BLUE}claude${NC}"
    echo ""
    echo "Or simply:"
    echo ""
    echo -e "    ${BLUE}ai${NC}"
    echo ""
    echo "The first time you run it, you'll be asked to log in."
    echo "Just follow the instructions on screen."
    echo ""
    echo -e "${YELLOW}Tip:${NC} Close and reopen your terminal, then type 'ai' to get started!"
    echo ""
}

main
