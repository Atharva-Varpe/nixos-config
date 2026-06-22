{ ... }:

{
  imports = [
    ./config/hardware-configuration.nix
    ./config/boot.nix
    ./config/networking.nix
    ./config/locale.nix
    ./config/desktop.nix
    ./config/printing.nix
    ./config/audio.nix
    ./config/users.nix
    ./config/nix.nix
    ./config/nvidia.nix
    ./config/overlays.nix
    ./config/state.nix
  ];
}
