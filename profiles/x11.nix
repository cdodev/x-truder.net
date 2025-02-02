{ config, lib, ... }:

with lib;

let
  cfg = config.profiles.x11;
in {
  options.profiles.x11 = {
    enable = mkEnableOption "Whether to enable x11 server profile.";
  };

  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;
      autorun = true;
      exportConfiguration = true;

      layout = "si";

      windowManager.i3.enable = true;
      windowManager.default = "i3";
      displayManager.slim.enable = true;
    };

    networking.networkmanager.enable = true;
  };

}
