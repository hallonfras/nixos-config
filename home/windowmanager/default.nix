{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./niri
    ./sherlock
    ./vicinae
    ./waybar
    ./ags
  ];
}
