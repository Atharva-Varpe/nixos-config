{ system, zen-browser, nixpkgs-unstable, ... }:

{
  nixpkgs.overlays = [
    (import ../../../pkgs/overlay.nix { inherit zen-browser system; })
    (final: prev: {
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    })
  ];
}
