{ config, pkgs, ... }:

{
  home.username = "ijadux2";
  home.homeDirectory = "/home/ijadux2";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neovim
    zsh
    kitty
    starship
    zoxide
    ghostty
    nushell
  ];

  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh.enable = true;

  # Neovim config
  home.file.".config/nvim".source = ./nvim;

  # Terminal configs
  home.file.".zshrc".source = ./terminal-conf/zshrc;
  home.file.".config/starship.toml".source = ./terminal-conf/starship.toml;
  home.file.".config/kitty/kitty.conf".source = ./terminal-conf/kitty.conf;
  home.file.".config/ghostty/config".source = ./terminal-conf/ghostty-config;
  home.file.".config/nushell/config.nu".source = ./terminal-conf/config.nu;

  # Themes
  home.file.".themes/Catppuccin-Dark".source = ./themes/Catppuccin-Dark;
  home.file.".themes/Catppuccin-Dark-hdpi".source = ./themes/Catppuccin-Dark-hdpi;
  home.file.".themes/Catppuccin-Dark-xhdpi".source = ./themes/Catppuccin-Dark-xhdpi;

  # Icons
  home.file.".local/share/icons/macOS".source = ./icons/macOS;
  home.file.".local/share/icons/WhiteSur-red-dark".source = ./icons/WhiteSur-red-dark;

  # Wallpapers
  home.file."Pictures/wallpapers/cat_leaves.png".source = ./wallpaper/cat_leaves.png;
  home.file."Pictures/wallpapers/nixos.png".source = ./wallpaper/nixos.png;
  home.file."Pictures/wallpapers/wp11849570-219-4k-wallpapers.jpg".source = ./wallpaper/wp11849570-219-4k-wallpapers.jpg;

  # Environment variables or other settings can be added here
}
