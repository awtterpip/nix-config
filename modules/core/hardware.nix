{pkgs, ...}: {
  hardware.opengl = {
    enable = true;

    driSupport = true;
    driSupport32Bit = true;

    extraPackages = with pkgs; [ 
      amdvlk 
      rocmPackages.clr.icd
    ];
    extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
  };
  hardware.enableRedistributableFirmware = true;
  powerManagement.cpuFreqGovernor = "performance";
}
