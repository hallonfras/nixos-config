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
    python314
    python313Packages.dbus-python
    maven
    zulu17
    graphviz

    # Visual editor
    vscode-fhs
    zed-editor

    # Alternate version control system
    unstable.jujutsu

    # Development environments
    devenv
  ];
}
