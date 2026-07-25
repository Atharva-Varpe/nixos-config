{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      gs = "git status";
      ga = "git add";
      gaa = "git add --all";
      gc = "git commit";
      gcm = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gl = "git log --oneline --graph";
      gd = "git diff";
      gds = "git diff --staged";
      gb = "git branch";
      gco = "git checkout";
      gsw = "git switch";
      grb = "git rebase";
      grs = "git restore";
      rebuild = "sudo nixos-rebuild switch --flake ~/Luna#luna";
      hm = "home-manager switch --flake ~/Luna#luna";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      nvd = "neovide";
    };
  };

  programs.fetch = {
    enable = true;
    labelColor = "cyan";
    spin = "xy";
    speed = 1.0;
  };
}
