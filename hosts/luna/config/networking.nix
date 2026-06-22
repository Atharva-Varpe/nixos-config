{ ... }:

{
  networking.hostName = "luna";
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "default";
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];

  services.openssh.enable = true;
}
