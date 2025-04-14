{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./shell.nix
    ./helix.nix
  ];

  home.packages = with pkgs; [
    # Python formatter
    black

    # Terminal emulator
    unstable.ghostty

    # Power monitor
    upower

    # Network diagnostic tool (for bachelors thesis)
    tcpdump

    # Disk imager
    caligula

    # Terminal text viewer
    moar

    # Terminal multiplexer
    tmux

    # X tool
    xorg.xhost
  ];

  programs.git = {
    enable = true;
    userName = "hallonfras";
    userEmail = "isaacwesterman@gmail.com";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  xdg.configFile."ghostty/config".text = ''
    config-file = colors

    confirm-close-surface = false

    font-family = Fragment Mono
    font-family-bold = Fragment Mono
    font-family-italic = Fragment Mono
    font-family-bold-italic = Fragment Mono

    font-size = 12

    window-theme = auto
    window-title-font-family = Inter

    window-padding-color = extend
    window-padding-x = 6
    window-padding-y = 6

    keybind = ctrl+w=close_surface
  '';

  # Yazi
  programs.yazi.enable = true;
}
