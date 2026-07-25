{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font";
      font_size = 13;
      background_opacity = "0.65";
      confirm_os_window_close = 0;
    };
  };
}
