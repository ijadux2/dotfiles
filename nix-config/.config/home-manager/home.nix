{ config, pkgs, ... }:

{
  
  home.username = "ijadux2";
  home.homeDirectory = "/home/ijadux2";

 
  home.stateVersion = "25.05"; # Please read the comment before changing.

 
  home.packages = with pkgs; [
   nitch
   curl
   neofetch
   fastfetch
   python3
   pipx
   github-desktop
   figlet
   lolcat
   cava
   btop
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
    };
  };
   
  programs.zsh.initContent = "nitch";
 
  home.file = {
   
  };

 
  home.sessionVariables = {
     EDITOR = "micro";
  };

  programs.home-manager.enable = true;
}
