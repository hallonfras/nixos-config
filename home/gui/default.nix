{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    # Bluetooth gui
    overskride

    # File manager
    nautilus

    # Disk manager
    gnome-disk-utility

    # Communication
    vesktop
    slack

    # Image viewer
    sxiv

    # Browser
    inputs.zen-browser.packages."${pkgs.system}".default

    # Video player

    mpv
  ];

  # GTK Settings
  gtk.font.name = "Inter";

  # Install pdf-viewer zathura
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
    };
  };
}
