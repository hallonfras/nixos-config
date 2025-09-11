{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./niri
    ./vicinae
    ./waybar
    ./bar
  ];
}
