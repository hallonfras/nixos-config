{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
  ];

  home.packages = with pkgs; [
    cargo
    gcc
  ];
}
