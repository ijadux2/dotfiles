{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.hyprland;
in
{
  options.hyprland = {
    enable = mkEnableOption "Hyprland Wayland compositor and related apps";

    extraPackages = mkOption {
      type = types.listOf types.package;
      default = [];
      description = "Extra packages to install alongside Hyprland";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      hyprpaper
      hypridle
      hyprlock
      waybar
      rofi-wayland
      dunst
      swaybg
      wl-clipboard
      grim
      slurp
    ] ++ cfg.extraPackages;
  };
}
