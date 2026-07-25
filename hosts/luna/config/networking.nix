{ pkgs, ... }:

{
  networking.hostName = "luna";
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "default";
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];

  services.openssh.enable = true;

  services.netbird.enable = true;
  # Start netbird to join network, then immediately disconnect.
  # This registers the interface for on-demand use (e.g., via netbird up).
  systemd.services.netbird.serviceConfig.ExecStartPost = "${pkgs.netbird}/bin/netbird down";
}
