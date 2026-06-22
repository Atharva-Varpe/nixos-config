{ pkgs, ... }:
{
  imports = [
    ./options.nix
    ./keymaps.nix
    ./neovide.nix
    ./plugins/ui.nix
    ./plugins/lsp.nix
    ./plugins/cmp.nix
    ./plugins/telescope.nix
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
  };
}
