{ lib, ... }:

{
  boot.blacklistedKernelModules = [ "nouveau" ];

  services.xserver.videoDrivers = [ "modesetting" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    open = false;
    nvidiaSettings = true;
    prime = {
      offload.enable = lib.mkForce true;
      sync.enable = false;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
