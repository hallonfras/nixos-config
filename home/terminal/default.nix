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

    font-family = Iosevka
    font-family-bold = Iosevka
    font-family-italic = Iosevka
    font-family-bold-italic = Iosevka

    font-size = 14

    window-theme = auto
    window-title-font-family = Inter

    window-padding-color = extend
    window-padding-x = 6
    window-padding-y = 6
  '';

  # Yazi
  programs.yazi.enable = true;
}
