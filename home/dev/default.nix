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
    gnumake
    jq

    # Intro-AI
    rstudio

    # Visual editor
    vscode-fhs
    unstable.zed-editor

    # Alternate version control system
    unstable.jujutsu

    # Development environments
    devenv
  ];
}
