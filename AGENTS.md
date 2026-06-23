# Memory

## Project Overview
NixOS 26.05 flake-based system configuration for user `luna` on an Intel+NVIDIA hybrid laptop (Optimus). Defines both the NixOS system (`nixosConfigurations.luna`) and standalone home-manager (`homeConfigurations.luna`) builds.

See @README.md for the full project README.

## Architecture
- `flake.nix` — root flake with 8 inputs: nixpkgs (26.05 stable + unstable), home-manager, zen-browser, DankMaterialShell, niri-flake, nixvim, areofyl-fetch
- `hosts/luna/` — NixOS system config (hardware, boot, audio, networking, nvidia, desktop, nix settings)
- `home/luna/` — home-manager user config (packages, dotfiles, editors, browsers, git, desktop)
- `pkgs/` — custom packages: `antigravity-cli`, `command-code`, `nvim-config`; plus `overlay.nix`

## Key Technology Stack
- **Compositor**: Niri (scrollable tiling Wayland) with DankMaterialShell
- **Shell**: Fish (primary) + Starship, Bash (with aliases)
- **Terminal**: Kitty (transparent, font size 13)
- **Editor**: Nixvim (Neovim) — Catppuccin + DMS theme, LSP for Nix/Rust/TypeScript, Telescope, Treesitter
- **Browser**: Zen Browser (Firefox fork) with uBlock Origin, Dark Reader, Bitwarden
- **File Manager**: Yazi (terminal, Matugen-themed) + Nautilus (GUI)
- **Audio**: PipeWire with PulseAudio compat
- **Filesystem**: btrfs (subvolumes: root, home, nix)
- **GPU**: Intel iGPU (display) + NVIDIA discrete (offload), proprietary driver
- **AI agents**: antigravity-cli (`agy`), command-code (`cmd`/`cmdc`), gemini-cli, opencode

## Build Commands
```bash
# Full NixOS system rebuild
sudo nixos-rebuild switch --flake .#luna

# Home-manager standalone
home-manager switch --flake .#luna
```

## Code Style
- Nix modules organized by concern (one file per topic: audio.nix, boot.nix, etc.)
- Home-manager packages split into domain files: browsers.nix, cli-tools.nix, desktop.nix, editors.nix, git.nix
- Custom packages live in `pkgs/` with their own `default.nix`
- Overlays aggregate custom packages via `pkgs/overlay.nix`
- Wayland environment variables set globally (QT_QPA_PLATFORM, MOZ_ENABLE_WAYLAND, ELECTRON_OZONE_PLATFORM_HINT, etc.)

