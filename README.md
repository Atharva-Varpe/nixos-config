# Luna — NixOS Configuration

NixOS 26.05 flake-based system and home-manager configuration for a developer workstation on an Intel+NVIDIA hybrid laptop.

## System

| Component | Detail |
|---|---|
| **OS** | NixOS 26.05 |
| **Compositor** | Niri (scrollable tiling Wayland) + DankMaterialShell |
| **Display Manager** | DMS Greeter |
| **Shell** | Fish (primary) + Starship, Bash |
| **Terminal** | Kitty (transparent, font size 13) |
| **Editor** | Nixvim (Catppuccin/DMS theme, LSP for Nix/Rust/TypeScript) |
| **Browser** | Zen Browser (uBlock Origin, Dark Reader, Bitwarden) |
| **File Manager** | Yazi (Matugen-themed) + Nautilus |
| **Audio** | PipeWire |
| **Filesystem** | btrfs (root, home, nix subvolumes) |
| **GPU** | Intel iGPU (display) + NVIDIA discrete (offload) |

## Structure

```
flake.nix                   Root flake (8 inputs, 2 outputs)
hosts/luna/                 NixOS system config
  config.nix                  Entry point
  config/
    hardware-configuration.nix
    boot.nix                  systemd-boot EFI
    audio.nix                 PipeWire
    desktop.nix               Niri + DMS + portals
    nvidia.nix                Prime offload
    networking.nix            NetworkManager + firewall
    locale.nix                en_IN, Asia/Kolkata
    nix.nix                   Flakes, unfree, overlays
    overlays.nix              Custom package overlays
    users.nix                 User luna
    printing.nix              CUPS
    state.nix                 stateVersion
home/luna/                  Home-manager user config
  home.nix                    Entry point
  packages/
    default.nix               Package aggregator
    browsers.nix              Zen Browser + Firefox
    cli-tools.nix             CLI tools
    desktop.nix               DMS, Niri, Kitty, Yazi
    editors.nix               Neovide
    git.nix                   Git + gh
  config/
    nixvim/default.nix        Nixvim config
    matugen/                  Material theme templates for Yazi
pkgs/                       Custom packages
  overlay.nix                 Overlay definition
  antigravity-cli/            Google Antigravity CLI (`agy`)
  command-code/               CommandCode AI agent (`cmd`)
  nvim-config/                AstroNvim template
```

## Build

```bash
# Full NixOS system rebuild
sudo nixos-rebuild switch --flake .#luna

# Home-manager standalone
home-manager switch --flake .#luna
```

## Flake Inputs

| Input | Source |
|---|---|
| nixpkgs | NixOS/nixpkgs/nixos-26.05 |
| nixpkgs-unstable | NixOS/nixpkgs/nixos-unstable |
| home-manager | nix-community/home-manager/release-26.05 |
| zen-browser | youwen5/zen-browser-flake |
| dms | AvengeMedia/DankMaterialShell/stable |
| niri | sodiboo/niri-flake |
| nixvim | nix-community/nixvim/nixos-26.05 |
| areofyl-fetch | github:areofyl/fetch |

## AI Agents

| Tool | Command | Description |
|---|---|---|
| Antigravity CLI | `agy` | Google terminal AI coding agent |
| CommandCode | `cmd` / `cmdc` | AI coding agent with taste learning |
| Gemini CLI | `gemini` | Google Gemini CLI |
| OpenCode | `opencode` | OpenCode tool |

