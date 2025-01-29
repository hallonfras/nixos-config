{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./podman.nix
  ];

  home.packages = with pkgs; [
    cargo
    gcc
    python39
    python312Packages.dbus-python
  ];
}
