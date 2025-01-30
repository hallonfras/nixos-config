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
    python39
    python312Packages.dbus-python
  ];
}
