{ system, zen-browser, nixpkgs-unstable, ... }:
{
  nixpkgs.overlays = [
    (import ../../../pkgs/overlay.nix { inherit zen-browser system nixpkgs-unstable; })
  ];
}
