{ pkgs, ... }:

{
  imports = [
    ../config/nixvim/default.nix
  ];

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
  ];

  # Matugen template for yazi dynamic theming
  xdg.configFile."matugen/templates/yazi.toml".source = ../config/matugen/templates/yazi.toml;

  # Matugen config to register the yazi template
  xdg.configFile."matugen/config.toml".source = ../config/matugen/config.toml;
}
