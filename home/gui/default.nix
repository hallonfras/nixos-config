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
    loupe

    # Image Editor
    gimp

    # Font viewer
    gnome-font-viewer

    # Browser
    inputs.zen-browser.packages."${pkgs.system}".default

    # Video player
    mpv

    # Display configurator
    wdisplays

    # Remote meetings
    unstable.zoom-us
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
