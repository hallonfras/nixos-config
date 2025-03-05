{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./niri
    ./walker
    ./waybar
    ./ags
  ];
}
