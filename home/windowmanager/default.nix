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
    ./waybar
    ./ags
  ];
}
