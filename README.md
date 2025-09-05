# Dotfiles

This repository contains my personal dotfiles, designed to be adaptive across NixOS and other Linux distributions. The setup emphasizes minimal use of Home Manager on NixOS, favoring direct file management or Nix flakes where possible, while remaining portable for non-Nix systems.

## Overview

These dotfiles configure a modern development environment with:
- **Neovim** with LazyVim for efficient editing
- **Terminal emulators**: Kitty, Ghostty, and Nushell
- **Shell**: Zsh with Oh My Zsh, Starship prompt, and Zoxide
- **Themes**: Catppuccin-Dark GTK theme
- **Icons**: WhiteSur-red-dark icon theme and macOS-style cursors
- **Wallpapers**: Custom wallpapers

The configurations are modular and can be used selectively.

## Structure

```
dotfiles/
├── icons/                 # Icon themes (WhiteSur-red-dark, macOS cursors)
├── nvim/                  # Neovim configuration with LazyVim
├── terminal-conf/         # Terminal and shell configs
│   ├── config.nu          # Nushell configuration
│   ├── ghostty-config     # Ghostty terminal config
│   ├── kitty.conf         # Kitty terminal config
│   ├── starship.toml      # Starship prompt config
│   └── zshrc              # Zsh configuration
├── themes/                # GTK themes (Catppuccin-Dark)
└── wallpaper/             # Wallpaper images
```

## Prerequisites

- **NixOS**: Nix package manager (flakes enabled if using flakes)
- **Other distros**: Standard Linux tools (git, curl, etc.)
- **Fonts**: JetBrains Mono NF, Google Sans Code (install via your package manager)
- **Dependencies**:
  - Neovim
  - Zsh, Oh My Zsh
  - Starship
  - Zoxide
  - Kitty or Ghostty
  - Nushell (optional)
  - GTK-related tools for themes

## Installation

### On NixOS (Minimal Home Manager)

1. Clone the repository:
   ```bash
   git clone https://github.com/ijadux2/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. For minimal Home Manager usage, create a basic `home.nix`:
   ```nix
   # ~/home.nix
   { config, pkgs, ... }:
   {
     home.packages = with pkgs; [
       neovim
       zsh
       kitty
       starship
       zoxide
       # Add other packages as needed
     ];

     # Minimal Home Manager config - just enable programs
     programs.starship.enable = true;
     programs.zoxide.enable = true;

     # For themes, you might need to set GTK theme manually or use dconf
   }
   ```

3. If using Nix flakes, add to your `flake.nix`:
   ```nix
   # flake.nix
   {
     inputs = {
       nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
       home-manager = {
         url = "github:nix-community/home-manager";
         inputs.nixpkgs.follows = "nixpkgs";
       };
     };

     outputs = { self, nixpkgs, home-manager }: {
       nixosConfigurations.yourhostname = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         modules = [
           ./configuration.nix
           home-manager.nixosModules.home-manager
           {
             home-manager.useGlobalPkgs = true;
             home-manager.useUserPackages = true;
             home-manager.users.yourusername = import ./home.nix;
           }
         ];
       };
     };
   }
   ```

4. Symlink or copy configs:
   ```bash
   # Neovim
   ln -sf ~/dotfiles/nvim ~/.config/nvim

   # Terminal configs
   ln -sf ~/dotfiles/terminal-conf/zshrc ~/.zshrc
   ln -sf ~/dotfiles/terminal-conf/starship.toml ~/.config/starship.toml
   ln -sf ~/dotfiles/terminal-conf/kitty.conf ~/.config/kitty/kitty.conf
   ln -sf ~/dotfiles/terminal-conf/ghostty-config ~/.config/ghostty/config
   ln -sf ~/dotfiles/terminal-conf/config.nu ~/.config/nushell/config.nu

   # Themes and icons
   sudo cp -r ~/dotfiles/themes/* /usr/share/themes/
   sudo cp -r ~/dotfiles/icons/* /usr/share/icons/

   # Wallpapers
   cp ~/dotfiles/wallpaper/* ~/Pictures/
   ```

5. Rebuild and switch:
   ```bash
   sudo nixos-rebuild switch
   home-manager switch  # If using Home Manager
   ```

### On Other Linux Distributions

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Install dependencies (example for Ubuntu/Debian):
   ```bash
   sudo apt update
   sudo apt install neovim zsh kitty ghostty curl git
   # Install Oh My Zsh
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   # Install Starship
   curl -sS https://starship.rs/install.sh | sh
   # Install Zoxide
   curl -sS https://webinstall.dev/zoxide | bash
   ```

3. Symlink configurations:
   ```bash
   # Neovim
   ln -sf ~/dotfiles/nvim ~/.config/nvim

   # Zsh
   ln -sf ~/dotfiles/terminal-conf/zshrc ~/.zshrc

   # Starship
   ln -sf ~/dotfiles/terminal-conf/starship.toml ~/.config/starship.toml

   # Kitty
   mkdir -p ~/.config/kitty
   ln -sf ~/dotfiles/terminal-conf/kitty.conf ~/.config/kitty/kitty.conf

   # Ghostty
   mkdir -p ~/.config/ghostty
   ln -sf ~/dotfiles/terminal-conf/ghostty-config ~/.config/ghostty/config

   # Nushell
   mkdir -p ~/.config/nushell
   ln -sf ~/dotfiles/terminal-conf/config.nu ~/.config/nushell/config.nu

   # Themes and icons (system-wide, may require sudo)
   sudo cp -r ~/dotfiles/themes/* /usr/share/themes/
   sudo cp -r ~/dotfiles/icons/* /usr/share/icons/

   # Wallpapers
   cp ~/dotfiles/wallpaper/* ~/Pictures/
   ```

4. Set Zsh as default shell:
   ```bash
   chsh -s $(which zsh)
   ```

5. For GTK themes, use your desktop environment's settings to select "Catppuccin-Dark".

## Customization

- **Neovim**: Edit `nvim/lua/plugins/example.lua` to add custom plugins.
- **Shell**: Modify `terminal-conf/zshrc` for aliases and plugins.
- **Themes**: Adjust GTK themes in `themes/` or replace with your preferred ones.
- **Icons**: Update icon themes in `icons/` as needed.

## Updating

Pull the latest changes and re-symlink if necessary:
```bash
cd ~/dotfiles
git pull
# Re-run symlink commands if new files added
```

## Notes

- These dotfiles are designed for personal use; adapt paths and configurations as needed.
- For NixOS, the minimal Home Manager approach keeps things simple while allowing Nix's reproducibility.
- On non-Nix systems, ensure package versions are compatible.
- Wallpapers are personal; replace with your own.

## License

This repository is licensed under the MIT License. Feel free to fork and customize!
