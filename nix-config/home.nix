{ config, pkgs, ... }:

{
  
  home.username = "ijadux2";
  home.homeDirectory = "/home/ijadux2";

 
  home.stateVersion = "25.05"; # Please read the comment before changing.

 
  home.packages = with pkgs; [
   nitch
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
   kitty
   nerd-fonts.caskaydia-cove
   github-desktop
   gnumake
   brave
   gcc
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
