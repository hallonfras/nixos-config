{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # Cool wallpaper colorizer
    gowall
    inputs.matugen.packages.${system}.default

    (writeShellScriptBin "setwall" ''
      cp -f $1 /home/isaac/Pictures/wallpaper
      swww img /home/isaac/Pictures/wallpaper
    '')
  ];

  xdg.configFile."matugen/" = {
    source = config.lib.file.mkOutOfStoreSymlink /home/isaac/.nixos-config/home/theming/matugen;
    # optional: overwrite existing file
    force = true;
  };

  xdg.configFile."gtk-3.0/gtk.css" = {
    text = "@import 'colors.css';";
  };

  xdg.configFile."gtk-4.0/gtk.css" = {
    text = "@import 'colors.css';";
  };
}
