{ pkgs, ... }:

{
  programs.firefox.enable = true;

  home.packages = [
    (pkgs.wrapFirefox pkgs.zen-browser-unwrapped {
      pname = "zen-browser";
      nativeMessagingHosts = [ pkgs.bitwarden-desktop ];
      extraPolicies = {
        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "normal_installed";
            default_area = "navbar";
          };
          "addon@darkreader.org" = {
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/darkreader/latest.xpi";
            installation_mode = "normal_installed";
            default_area = "navbar";
          };
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            installation_mode = "normal_installed";
            default_area = "navbar";
          };
        };
      };
    })
  ];
}
