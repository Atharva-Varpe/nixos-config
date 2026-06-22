{ lib, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.access-tokens = lib.mkIf (builtins.pathExists /etc/nix/access-tokens) (
    let
      lines = lib.splitString "\n" (builtins.readFile /etc/nix/access-tokens);
      pairs = lib.filter (s: s != "") lines;
      parse = pair:
        let parts = lib.splitString "=" pair; in {
          name = lib.elemAt parts 0;
          value = lib.concatStringsSep "=" (lib.sublist 1 (lib.length parts - 1) parts);
        };
    in lib.listToAttrs (map parse pairs)
  );
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    # Required by bitwarden-desktop until upstream updates to newer Electron
    "electron-39.8.10"
  ];
}
