{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Deaths-Of-Deames";
  
  # nix config and hyprland setup !
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.hyprland.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";


  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    thisjack.enable = true;
  };

  users.users.ijadux2 = {
    isNormalUser = true;
    description = "ijadux2";
    shell = "pkgs.zsh"; 
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    brave
    vscodium
    hypridle
    hyprlock
    hyprpaper
    waybar
    rofi-wayland
    swaybg
    wl-clipboard
    grim
    slurp
    nwg-look 
    hyprpolkitagent
    wlogout
    nwg-displays
    cliphist
    nautilus
    ags
    libsForQt5.qt5ct
    catppuccin-qt5ct
    kdePackages.qt6ct
    wallust
    swappy
    btop
    cava
    fastfetch
    neovim
    zsh
    bluez
    blueman
    curl
    git
    pciutils
    nerd-fonts.victor-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.fantasque-sans-mono
  ];

  system.stateVersion = "25.05"; # Did you read the comment?

}
