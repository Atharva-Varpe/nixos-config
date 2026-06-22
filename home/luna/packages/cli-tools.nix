{ pkgs, ... }:

{
  home.packages = with pkgs; [
    antigravity-cli
    command-code
    gemini-cli
    opencode
  ];
}
