{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    jq
    curl
    wget
    tree
    htop
    btop
    fastfetch
    p7zip
    file
    dnsutils
    pciutils
    usbutils
  ];
}
