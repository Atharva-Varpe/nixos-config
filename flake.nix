{
  description = "Luna's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    areofyl-fetch = {
      url = "github:areofyl/fetch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, zen-browser, dms, niri, nixvim, areofyl-fetch, ... }: let
    system = "x86_64-linux";
    overlay = import ./pkgs/overlay.nix;
  in {
    nixosConfigurations.luna = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit zen-browser niri system nixpkgs-unstable; };
      modules = [
        niri.nixosModules.niri
        ./hosts/luna/config.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.users.luna = { ... }: {
            imports = [
              dms.homeModules.dank-material-shell
              dms.homeModules.niri
              nixvim.homeModules.nixvim
              areofyl-fetch.homeManagerModules.default
              ./home/luna/home.nix
            ];
          };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
      ];
    };

    homeConfigurations.luna = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system}.extend (overlay { inherit zen-browser system nixpkgs-unstable; });
      modules = [
        niri.homeModules.niri
        dms.homeModules.dank-material-shell
        dms.homeModules.niri
        nixvim.homeModules.nixvim
        areofyl-fetch.homeManagerModules.default
        ./home/luna/home.nix
      ];
    };
  };
}
