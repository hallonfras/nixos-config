{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    sherlock-launcher
  ];
}
