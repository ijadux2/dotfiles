
{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      <home-manager/nixos>
      ./hyprland.nix
    ];


    users.users.eve.isNormalUser = true;
    
    home-manager.users.eve = { pkgs, ... }: {
      home.packages = [ pkgs.atool pkgs.httpie ];
      programs.bash.enable = true;
      home.stateVersion = "25.05";
    };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Ghost-Of-Uchiha"; # Define your hostname.

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

  };
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ijadux2 = {
    isNormalUser = true;
    description = "ijadux2";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  #zsh
  programs.zsh.enable = true;

  users.users.ijadux2 = {
    shell = pkgs.zsh;
  };

  #flakes and system-config 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  services.flatpak.enable = true;

  system.autoUpgrade.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    ptyxis
    git
    micro
    vscodium
    sl
    cmatrix
    starship
  ];

  system.stateVersion = "25.05"; 

}
