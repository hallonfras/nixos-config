{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
  ];

  imports = [inputs.vicinae.homeModules.default];

  services.vicinae = {
    enable = true; # default: false
    autoStart = true; # default: true
  };
}
