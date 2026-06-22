{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    neovide
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      nvd = "neovide";
    };
  };
}
