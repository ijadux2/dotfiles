{ config, pkgs, ... }:

imports = [ 
  ./hypr-keybinds.nix 
];


{
  programs.hyprland = {
    enable = true;
    config = ''
      # General settings
      monitor=DP-1,2560x1440@144,1,0,0

      # Set wallpaper (Catppuccin mocha wallpaper)
      background=DP-1,/home/ijadux2/Pictures/catppuccin-mocha-wallpaper.jpg

      # Catppuccin Mocha color palette
      color_active_border=0xfff5e0dc
      color_inactive_border=0xff1e1e2e
      color_focused_border=0xfff2cdcd
      color_urgent_border=0xfff28fad
      color_background=0xff1e1e2e
      color_foreground=0xffcdd6f4
      color_accent=0xfff5e0dc

      # Window decorations with Catppuccin colors
      decoration_border_size=2
      decoration_border_color_active=$color_focused_border
      decoration_border_color_inactive=$color_inactive_border
      decoration_border_color_urgent=$color_urgent_border
      decoration_title_color_active=$color_foreground
      decoration_title_color_inactive=0xff6c7086
      decoration_title_color_urgent=0xfff28fad
      decoration_background_color=0xff1e1e2e

      # Window rules
      windowrulev2 = "float, class:^(kitty|Thunar|flameshot|pavucontrol)$";

      # Waybar config path
      exec=waybar

      # Rofi launcher with Catppuccin theme
      exec=rofi -show drun -theme ~/nixos-config/catppuccin.rasi

      # Notification daemon with Catppuccin colors
      exec=dunst

      # Other settings can be set here according to your needs
    '';
  };

  {
    windowrulev2 = "float, class:^(Thunar|flameshot|pavucontrol)$";
    monitor = "eDP-1,1920x1080@144,0,0,0";
    bind = "SUPER+SHIFT+Q,exec,hyprctl dispatch killactive";
  }

  environment.systemPackages = with pkgs; [
    kitty  # terminal
    waybar # topbar
    swww   # wallpaper setter
    barve  # web browser
    nautilus  # file manager
    rofi-wayland   # application launcher
    dunst  # notification daemon
    catppuccin-theme  # hypothetical package for Catppuccin GTK/QT themes
    hyprlock
    hyprpaper
    hyprpolkitagent
    wl-clipboard
    nitch
    mako
    pavucontrol

  ];

    services.pipewire.enable = true;

  # GTK and QT theme settings
  environment.variables = {
    GTK_THEME = "Catppuccin-Mocha";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    XCURSOR_THEME = "Catppuccin";
    XCURSOR_SIZE = "24";
  };

  # Fonts
  fonts.fonts = with pkgs; [
    noto-fonts-emoji
    jetbrains-mono
  ];
 

 
