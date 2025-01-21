{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./hyprland
    ./niri
    ./walker
    ./waybar
    ./ags
  ];
}
