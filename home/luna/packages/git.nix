{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gh
    git-lfs
    delta
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Atharva";
      user.email = "atharva.varpe2019@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      credential.helper = "${pkgs.gh}/bin/gh auth git-credential";
      delta = {
        navigate = true;
        side-by-side = true;
        line-numbers = true;
      };
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."*" = {
      AddKeysToAgent = "yes";
      HashKnownHosts = true;
    };
  };
}
