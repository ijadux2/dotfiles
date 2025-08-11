{ config, pkgs, ... }:

{
  
  home.username = "ijadux2";
  home.homeDirectory = "/home/ijadux2";

 
  home.stateVersion = "25.05"; # Please read the comment before changing.

 
  home.packages = with pkgs; [
   nitch
   kitty
   whitesur-gtk-theme
   tokyonight-gtk-theme
   whitesur-icon-theme
   whitesur-cursors
   bibata-cursors
   nix
   curl
   neofetch
   fastfetch
   python3
   pipx
   figlet
   lolcat
   cava
   btop
   htop
   stow
   zoxide
   fzf
   bat
   nerdfetch
   vscodium
   cowsay
   glib
   gnome-tweaks
   nerd-fonts.caskaydia-cove
   github-desktop
   gnumake
   brave
   gcc
   gnomeExtensions.blur-my-shell
   gnomeExtensions.dash-to-dock
   gnomeExtensions.search-light
   gnomeExtensions.workspace-switcher-manager
   gnomeExtensions.user-themes
   gnomeExtensions.clipboard-history   
  ];

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "starship" ];
      theme = "robbyrussell";
    };
    shellAliases = {
      ll = "ls -l";
      m = "micro";
      cat = "bat";
      x = "clear";
    };
  };
   
 programs.zsh.initContent = ''
   nitch
   export MICRO_TRUECOLOR=1
 '';

 
 

  programs.zoxide.enable = true;

  home.enableNixpkgsReleaseCheck = false;
    
  home.file = {
   
  };

 
  home.sessionVariables = {
     EDITOR = "micro";
  };

  programs.home-manager.enable = true;

  
}

