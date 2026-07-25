{ ... }:

{
  # UPower — provides battery status over D-Bus (used by DMS/Quickshell)
  services.upower.enable = true;

  # power-profiles-daemon — CPU power mode switching (powersave/balanced/performance).
  # Coexists with hardware.nvidia.powerManagement (GPU power state).
  services.power-profiles-daemon.enable = true;
}
