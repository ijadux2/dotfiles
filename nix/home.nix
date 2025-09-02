{ config, pkgs, ... }:

{
 
  home.username = "chidori";
  home.homeDirectory = "/home/chidori";
  home.enableNixpkgsReleaseCheck = false;
  
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
   nitch
   git
   curl
   micro
   wget
   kitty
   feh
   nix
   python3
   pipx
   cava
   htop
   zoxide
   fzf
   bat
   vscodium
   cowsay
   glib
   gnome-tweaks
   nerd-fonts.fira-code
   github-desktop
   gnumake
   gcc
   gnomeExtensions.blur-my-shell
   gnomeExtensions.dash-to-dock
   gnomeExtensions.search-light
   gnomeExtensions.workspace-switcher-manager
   gnomeExtensions.user-themes
   gnomeExtensions.clipboard-history   
   gnomeExtensions.switch-workspace
   zsh
   starship
   cmatrix
   sl
   rig
  ];

  home.file = {
   
  };

 
  home.sessionVariables = {
     EDITOR = "micro";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  }
 
