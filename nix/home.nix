{ config, pkgs, ... }:

{
  home.username = "ijadux2";
  home.homeDirectory = "/home/ijadux2";
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "24.11";

  programs.zsh = {
  enable = true;
  shellAliases = {
    ll = "ls -l";
    ls = "lsd";
    v = "nvim";
    x = "clear";
    cd = "z";
    lt = "ls --tree";
    rene-sharingan = "nvim ~/.config/home-manager/home.nix";
    sharingan = "home-manager switch";
    yay = "pacstall";
   # cat = "bat";
  };
  history = {
    size = 10000;
    path = "/home/ijadux2/.zsh_history";
  };
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "sudo" "z" "starship" ];
    theme = "robbyrussell";
  };
};

  home.packages = with pkgs; [
    starship
    zoxide
    bat
  ];

  # Neovim config
  home.file.".config/nvim".source = ~/pista/dotfiles/nvim;

  # Terminal configs
  home.file.".zshrc".source = ~/pista/dotfiles/terminal.conf/zshrc;
  home.file.".config/starship.toml".source = ~/pista/dotfiles/terminal.conf/starship.toml;
  home.file.".config/kitty/kitty.conf".source = ~/pista/dotfiles/terminal.conf/kitty.conf;
#  home.file.".config/ghostty/config".source = ./terminal-conf/ghostty-config;
  home.file.".config/nushell/config.nu".source = ~/pista/dotfiles/terminal.conf/config.nu;

  # Themes
  home.file.".themes/Catppuccin-Dark".source = ~/pista/dotfiles/themes/Catppuccin-Dark;
  home.file.".themes/Catppuccin-Dark-hdpi".source = ~/pista/dotfiles/themes/Catppuccin-Dark-hdpi;
  home.file.".themes/Catppuccin-Dark-xhdpi".source = ~/pista/dotfiles/themes/Catppuccin-Dark-xhdpi;

  # Icons
  home.file.".local/share/icons/macOS".source = ~/pista/dotfiles/icons/macOS;
  home.file.".local/share/icons/WhiteSur-red-dark".source = ~/pista/dotfiles/icons/WhiteSur-red-dark;

  # Wallpapers
  home.file."Pictures/wallpapers/cat_leaves.png".source = ~/pista/dotfiles/wallpaper/cat_leaves.png;
  home.file."Pictures/wallpapers/nixos.png".source = ~/pista/dotfiles/wallpaper/nixos.png;
  home.file."Pictures/wallpapers/wp11849570-219-4k-wallpapers.jpg".source = ~/pista/dotfiles/wallpaper/wp11849570-219-4k-wallpapers.jpg;

  home.sessionVariables = {
     EDITOR = "nvim";
  };
  programs.home-manager.enable = true;
}
