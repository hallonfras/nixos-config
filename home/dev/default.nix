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
    maven
    zulu17
    graphviz

    # Visual editor
    vscode-fhs
    zed-editor

    # Alternate version control system
    jujutsu

    # Development environments
    devenv
  ];
}
