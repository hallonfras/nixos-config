{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    niri
    unstable.swww
    xwayland-satellite
    waypaper
    gammastep
    brightnessctl
    kanshi
  ];

  services.mako.enable = true;

  xdg.configFile."niri/config.kdl" = {
    source = config.lib.file.mkOutOfStoreSymlink /home/isaac/.nixos-config/home/windowmanager/niri/config.kdl;
    # optional: overwrite existing file
    force = true;
  };

  xdg.configFile."kanshi/config" = {
    source = config.lib.file.mkOutOfStoreSymlink /home/isaac/.nixos-config/home/windowmanager/niri/config;
    # optional: overwrite existing file
    force = true;
  };
}
