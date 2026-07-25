{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zen-browser
    bitwarden-desktop
  ];
}
