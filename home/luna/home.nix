{ ... }:

{
  imports = [
    ./packages
  ];

  home.username = "luna";
  home.homeDirectory = "/home/luna";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
