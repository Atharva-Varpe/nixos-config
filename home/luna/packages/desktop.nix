{ pkgs, ... }:

{
  imports = [
    ../config/nixvim/default.nix
  ];

  programs.fish = {
    enable = true;
    shellAbbrs = {
      gs = "git status";
      ga = "git add";
      gaa = "git add --all";
      gc = "git commit";
      gcm = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gl = "git log --oneline --graph";
      gd = "git diff";
      gds = "git diff --staged";
      gb = "git branch";
      gco = "git checkout";
      gsw = "git switch";
      grb = "git rebase";
      grs = "git restore";
      rebuild = "sudo nixos-rebuild switch --flake ~/Luna#luna";
      hm = "home-manager switch --flake ~/Luna#luna";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font";
      font_size = 13;
      background_opacity = "0.65";
      confirm_os_window_close = 0;
    };
  };

  programs.fetch = {
    enable = true;
    labelColor = "cyan";
    spin = "xy";
    speed = 1.0;
  };

  programs.dank-material-shell = {
    enable = true;
    settings = {
      cornerRadius = 0;
      dynamicTheming = true;
      niriLayoutBorderSize = 1;
      niriLayoutGapsOverride = 8;
      useAutoLocation = true;
      popupTransparency = 90;
      dockTransparency = 90;
      barConfigs = [{
        id = "default";
        name = "Main Bar";
        enabled = true;
        position = 0;
        screenPreferences = [ "all" ];
        showOnLastDisplay = true;
        leftWidgets = [ "launcherButton" "workspaceSwitcher" "focusedWindow" ];
        centerWidgets = [ "music" "clock" "weather" ];
        rightWidgets = [ "systemTray" "clipboard" "cpuUsage" "memUsage" "notificationButton" "battery" "controlCenterButton" ];
        spacing = 8;
        innerPadding = 8;
        bottomGap = 0;
        transparency = 95;
        widgetTransparency = 95;
      }];
    };
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    niri = {
      includes = {
        enable = true;
        override = false;
      };
    };
    enableVPN = false;
    enableAudioWavelength = false;
    enableCalendarEvents = false;
  };

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };

  home.packages = with pkgs; [
    grim
    slurp
    pavucontrol
    brightnessctl
    nautilus
    bitwarden-desktop
  ];

  # Matugen template for yazi dynamic theming
  xdg.configFile."matugen/templates/yazi.toml".source = ../config/matugen/templates/yazi.toml;

  # Matugen config to register the yazi template
  xdg.configFile."matugen/config.toml".source = ../config/matugen/config.toml;

  programs.niri.settings = {
    prefer-no-csd = true;
    hotkey-overlay = {
      skip-at-startup = true;
    };
    cursor = {
      theme = "breeze_cursors";
      size = 24;
    };
    xwayland-satellite = {
      enable = false;
    };
    layer-rules = [
      {
        matches = [{ namespace = "^quickshell$"; }];
        place-within-backdrop = true;
      }
    ];
    window-rules = [
      {
        opacity = 0.9;
      }
      {
        matches = [{ app-id = "^org\\.quickshell$"; }];
        open-floating = true;
      }
    ];
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
    FILE_MANAGER = "nautilus";
    XDG_CURRENT_DESKTOP = "niri";
    QT_QPA_PLATFORM = "wayland";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    QT_QPA_PLATFORMTHEME = "gtk3";
    MOZ_ENABLE_WAYLAND = "1";
    SDL_VIDEODRIVER = "wayland";
    XCURSOR_THEME = "breeze_cursors";
    XCURSOR_SIZE = "24";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
}
