{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    niri
    swww
    xwayland-satellite
    waypaper
  ];

  services.mako.enable = true;
}
