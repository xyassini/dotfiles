#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install Homebrew if not installed
# if ! command -v brew &> /dev/null; then
#     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# fi

# Install packages from Brewfile
# brew bundle install --file=$SCRIPT_DIR/Brewfile

# Function to create a symlink with backup functionality
link_config() {
    local config_name="$1"
    local source_path="$SCRIPT_DIR/$config_name"
    local target_path="$HOME/.config/$config_name"

    echo "=== Linking $config_name ==="

    # Check if source exists
    if [ ! -e "$source_path" ]; then
        echo "Warning: Source folder '$source_path' does not exist. Skipping."
        return 1
    fi

    # Create ~/.config directory if it doesn't exist
    mkdir -p "$HOME/.config"

    # Check if the target already exists
    if [ -e "$target_path" ]; then
        # Generate backup name with current timestamp
        TIMESTAMP=$(date '+%Y%m%d%H%M%S')
        BACKUP_NAME="${config_name}_bk_$TIMESTAMP"
        BACKUP_PATH="$HOME/.config/$BACKUP_NAME"

        echo "Found existing $config_name config at $target_path"
        echo "Moving to backup: $BACKUP_PATH"

        # Move existing config to backup
        mv "$target_path" "$BACKUP_PATH"

        if [ $? -eq 0 ]; then
            echo "Successfully backed up existing config to $BACKUP_NAME"
        else
            echo "Error: Failed to backup existing $config_name config"
            return 1
        fi
    fi

    # Create the symlink
    echo "Creating symlink from $source_path to $target_path"
    ln -s "$source_path" "$target_path"

    if [ $? -eq 0 ]; then
        echo "Successfully linked $config_name config!"
        echo "Source: $source_path"
        echo "Target: $target_path"
        echo ""
        return 0
    else
        echo "Error: Failed to create symlink for $config_name"
        return 1
    fi
}

# Function to link config with custom target path
link_config_custom() {
    local config_name="$1"
    local custom_target="$2"
    local source_path="$SCRIPT_DIR/$config_name"

    echo "=== Linking $config_name to custom path ==="

    # Check if source exists
    if [ ! -e "$source_path" ]; then
        echo "Warning: Source folder '$source_path' does not exist. Skipping."
        return 1
    fi

    # Create target directory if it doesn't exist
    mkdir -p "$(dirname "$custom_target")"

    # Check if the target already exists
    if [ -e "$custom_target" ]; then
        # Generate backup name with current timestamp
        TIMESTAMP=$(date '+%Y%m%d%H%M%S')
        BACKUP_NAME="$(basename "$custom_target")_bk_$TIMESTAMP"
        BACKUP_PATH="$(dirname "$custom_target")/$BACKUP_NAME"

        echo "Found existing config at $custom_target"
        echo "Moving to backup: $BACKUP_PATH"

        # Move existing config to backup
        mv "$custom_target" "$BACKUP_PATH"

        if [ $? -eq 0 ]; then
            echo "Successfully backed up existing config to $BACKUP_NAME"
        else
            echo "Error: Failed to backup existing config"
            return 1
        fi
    fi

    # Create the symlink
    echo "Creating symlink from $source_path to $custom_target"
    ln -s "$source_path" "$custom_target"

    if [ $? -eq 0 ]; then
        echo "Successfully linked $config_name config!"
        echo "Source: $source_path"
        echo "Target: $custom_target"
        echo ""
        return 0
    else
        echo "Error: Failed to create symlink for $config_name"
        return 1
    fi
}

# Configuration list - add your configs here
# Format: "folder_name" or "folder_name:custom_target_path"
CONFIGS=(
    "ghostty"
    "nvim"
    "fish"
    "alacritty"
    # "tmux:.tmux.conf"                        # Links to ~/.tmux.conf
    # "git:.gitconfig"                         # Links to ~/.gitconfig
    # "zsh:.zshrc"                             # Links to ~/.zshrc
)

# Main execution
echo "Starting dotfiles linking process..."
echo "Script directory: $SCRIPT_DIR"
echo ""

# Track success/failure
SUCCESS_COUNT=0
TOTAL_COUNT=0

# Process each configuration
for config in "${CONFIGS[@]}"; do
    TOTAL_COUNT=$((TOTAL_COUNT + 1))

    # Check if config has custom target path
    if [[ "$config" == *":"* ]]; then
        # Split on colon
        config_name="${config%%:*}"
        custom_target="${config##*:}"

        # Handle ~ expansion
        custom_target="${custom_target/#~/$HOME}"

        if link_config_custom "$config_name" "$custom_target"; then
            SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
        fi
    else
        # Standard ~/.config/ linking
        if link_config "$config"; then
            SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
        fi
    fi
done

# Summary
echo "=== Summary ==="
echo "Successfully linked: $SUCCESS_COUNT/$TOTAL_COUNT configurations"

if [ $SUCCESS_COUNT -eq $TOTAL_COUNT ]; then
    echo "All configurations linked successfully! 🎉"
    exit 0
else
    echo "Some configurations failed to link. Please check the output above."
    exit 1
fi
