{ pkgs, ... }:

{
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
}
