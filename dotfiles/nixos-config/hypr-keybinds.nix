{ config, lib, pkgs, ... }:

{
  # Hyprland Keybindings Configuration
  # This file contains all keybindings for Hyprland window manager
  
  programs.hyprland.config = lib.mkAfter ''
    # ============================================
    # APPLICATION LAUNCHERS
    # ============================================
    bind = SUPER+ENTER, exec, kitty
    bind = SUPER+SHIFT+ENTER, exec, kitty --hold
    bind = SUPER+D, exec, rofi -show drun -theme ~/nixos-config/catppuccin.rasi
    bind = SUPER+SHIFT+D, exec, rofi -show window -theme ~/nixos-config/catppuccin.rasi
    bind = SUPER+E, exec, nautilus
    bind = SUPER+SHIFT+E, exec, kitty -e ranger
    bind = SUPER+F, exec, brave
    bind = SUPER+SHIFT+F, exec, kitty -e htop
    bind = SUPER+T, exec, kitty -e btop
    bind = SUPER+SHIFT+T, exec, kitty -e nvtop
    
    # ============================================
    # WINDOW MANAGEMENT
    # ============================================
    bind = SUPER+Q, killactive
    bind = SUPER+SHIFT+Q, exec, hyprctl dispatch killactive
    bind = SUPER+F, fullscreen, 0
    bind = SUPER+SHIFT+F, fullscreen, 1
    bind = SUPER+SPACE, togglefloating
    bind = SUPER+SHIFT+SPACE, exec, hyprctl dispatch togglefloating
    
    # ============================================
    # WORKSPACE NAVIGATION
    # ============================================
    bind = SUPER, 1, workspace, 1
    bind = SUPER, 2, workspace, 2
    bind = SUPER, 3, workspace, 3
    bind = SUPER, 4, workspace, 4
    bind = SUPER, 5, workspace, 5
    bind = SUPER, 6, workspace, 6
    bind = SUPER, 7, workspace, 7
    bind = SUPER, 8, workspace, 8
    bind = SUPER, 9, workspace, 9
    bind = SUPER, 0, workspace, 10
    
    # Move window to workspace
    bind = SUPER+SHIFT, 1, movetoworkspace, 1
    bind = SUPER+SHIFT, 2, movetoworkspace, 2
    bind = SUPER+SHIFT, 3, movetoworkspace, 3
    bind = SUPER+SHIFT, 4, movetoworkspace, 4
    bind = SUPER+SHIFT, 5, movetoworkspace, 5
    bind = SUPER+SHIFT, 6, movetoworkspace, 6
    bind = SUPER+SHIFT, 7, movetoworkspace, 7
    bind = SUPER+SHIFT, 8, movetoworkspace, 8
    bind = SUPER+SHIFT, 9, movetoworkspace, 9
    bind = SUPER+SHIFT, 0, movetoworkspace, 10
    
    # ============================================
    # WINDOW NAVIGATION
    # ============================================
    bind = SUPER, left, movefocus, l
    bind = SUPER, right, movefocus, r
    bind = SUPER, up, movefocus, u
    bind = SUPER, down, movefocus, d
    
    # Move windows
    bind = SUPER+SHIFT, left, movewindow, l
    bind = SUPER+SHIFT, right, movewindow, r
    bind = SUPER+SHIFT, up, movewindow, u
    bind = SUPER+SHIFT, down, movewindow, d
    
    # ============================================
    # LAYOUT MANAGEMENT
    # ============================================
    bind = SUPER+T, togglesplit
    bind = SUPER+G, togglegroup
    bind = SUPER+SHIFT+G, moveoutofgroup
    bind = SUPER+CTRL+G, moveintogroup
    
    # ============================================
    # RESIZE WINDOWS
    # ============================================
    bind = SUPER+R, exec, hyprctl dispatch resizeactive exact 50% 50%
    bind = SUPER+SHIFT+R, exec, hyprctl dispatch resizeactive exact 100% 100%
    
    # ============================================
    # SCREENSHOTS & RECORDING
    # ============================================
    bind = SUPER+SHIFT+S, exec, grim -g "$(slurp)" ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png
    bind = SUPER+CTRL+S, exec, grim ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png
    bind = SUPER+SHIFT+R, exec, wf-recorder -g "$(slurp)" -f ~/Videos/recordings/$(date +%Y-%m-%d_%H-%M-%S).mp4
    
    # ============================================
    # AUDIO & BRIGHTNESS CONTROLS
    # ============================================
    bind = , XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
    bind = , XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%
    bind = , XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
    bind = , XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle
    
    bind = , XF86MonBrightnessUp, exec, brightnessctl set +5%
    bind = , XF86MonBrightnessDown, exec, brightnessctl set 5%-
    
    # ============================================
    # SYSTEM CONTROLS
    # ============================================
    bind = SUPER+SHIFT+L, exec, swaylock -f -c 000000
    bind = SUPER+CTRL+L, exec, hyprctl dispatch dpms off
    bind = SUPER+CTRL+SHIFT+L, exec, hyprctl dispatch dpms on
    
    # ============================================
    # SPECIAL WORKSPACES
    # ============================================
    bind = SUPER, tab, cyclenext
    bind = SUPER+SHIFT, tab, cyclenext, prev
    
    # ============================================
    # LAYOUT COMMANDS
    # ============================================
    bind = SUPER+CTRL, 1, layoutmsg, orientationleft
    bind = SUPER+CTRL, 2, layoutmsg, orientationright
    bind = SUPER+CTRL, 3, layoutmsg, orientationtop
    bind = SUPER+CTRL, 4, layoutmsg, orientationbottom
    
    # ============================================
    # EMERGENCY RESET
    # ============================================
    bind = SUPER+CTRL+SHIFT+E, exit
    bind = SUPER+CTRL+SHIFT+R, exec, hyprctl reload
    
    # ============================================
    # FLOATING WINDOW CONTROLS
    # ============================================
    bind = SUPER+CTRL, left, resizeactive, -50 0
    bind = SUPER+CTRL, right, resizeactive, 50 0
    bind = SUPER+CTRL, up, resizeactive, 0 -50
    bind = SUPER+CTRL, down, resizeactive, 0 50
    
    # ============================================
    # WAYBAR CONTROLS
    # ============================================
    bind = SUPER+CTRL+B, exec, pkill waybar && waybar
    bind = SUPER+SHIFT+B, exec, pkill waybar
    
    # ============================================
    # CUSTOM SCRIPTS
    # ============================================
    bind = SUPER+ALT+T, exec, ~/.config/hypr/scripts/toggle-waybar.sh
    bind = SUPER+ALT+R, exec, ~/.config/hypr/scripts/restart-waybar.sh
    bind = SUPER+ALT+S, exec, ~/.config/hypr/scripts/screenshot-menu.sh
    
    # ============================================
    # MONITOR CONTROLS
    # ============================================
    bind = SUPER+P, exec, ~/.config/hypr/scripts/display-menu.sh
    bind = SUPER+SHIFT+P, exec, ~/.config/hypr/scripts/display-select.sh
    
    # ============================================
    # POWER MENU
    # ============================================
    bind = SUPER+SHIFT+ESC, exec, ~/.config/rofi/scripts/powermenu.sh
    
    # ============================================
    # CLIPBOARD MANAGER
    # ============================================
    bind = SUPER+V, exec, wl-paste -t text --watch clipman store
    bind = SUPER+SHIFT+V, exec, clipman pick -t rofi
    
    # ============================================
    # NOTIFICATION CONTROLS
    # ============================================
    bind = SUPER+N, exec, dunstctl close
    bind = SUPER+SHIFT+N, exec, dunstctl close-all
    bind = SUPER+CTRL+N, exec, dunstctl history-pop
    
    # ============================================
    # SPECIAL APPLICATIONS
    # ============================================
    bind = SUPER+W, exec, firefox
    bind = SUPER+SHIFT+W, exec, firefox --private-window
    bind = SUPER+C, exec, code
    bind = SUPER+SHIFT+C, exec, code --new-window
    
    # ============================================
    # TERMINAL APPLICATIONS
    # ============================================
    bind = SUPER+ALT+T, exec, kitty -e tmux new-session
    bind = SUPER+ALT+SHIFT+T, exec, kitty -e tmux attach
    
    # ============================================
    # MEDIA CONTROLS
    # ============================================
    bind = , XF86AudioPlay, exec, playerctl play-pause
    bind = , XF86AudioNext, exec, playerctl next
    bind = , XF86AudioPrev, exec, playerctl previous
    bind = , XF86AudioStop, exec, playerctl stop
    
    # ============================================
    # CUSTOM WAYBAR TOGGLES
    # ============================================
    bind = SUPER+CTRL+ALT+B, exec, ~/.config/waybar/scripts/toggle-waybar.sh
    
    # ============================================
    # WINDOW RULES FOR FLOATING WINDOWS
    # ============================================
    windowrulev2 = float,class:^(pavucontrol)$
    windowrulev2 = float,class:^(blueman-manager)$
    windowrulev2 = float,class:^(nm-connection-editor)$
    windowrulev2 = float,class:^(flameshot)$
    windowrulev2 = float,class:^(nwg-look)$
    windowrulev2 = float,class:^(nwg-displays)$
    windowrulev2 = float,class:^(rofi)$
    windowrulev2 = float,class:^(wofi)$
    windowrulev2 = float,class:^(slurp)$
    windowrulev2 = float,class:^(swaylock)$
    windowrulev2 = float,class:^(waybar)$
    
    # ============================================
    # WORKSPACE ASSIGNMENTS
    # ============================================
    windowrulev2 = workspace 1,class:^(firefox)$
    windowrulev2 = workspace 2,class:^(code)$
    windowrulev2 = workspace 3,class:^(kitty)$
    windowrulev2 = workspace 4,class:^(thunar)$
    windowrulev2 = workspace 5,class:^(discord)$
    windowrulev2 = workspace 6,class:^(spotify)$
    windowrulev2 = workspace 7,class:^(obsidian)$
    windowrulev2 = workspace 8,class:^(gimp)$
    windowrulev2 = workspace 9,class:^(steam)$
    windowrulev2 = workspace 10,class:^(virtualbox)$
  '';
}
