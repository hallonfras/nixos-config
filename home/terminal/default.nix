{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./shell.nix
  ];

  home.packages = with pkgs; [
    # Code formatters
    dprint
    alejandra

    # Cool Nice document tool
    typst
    tinymist
    typstyle
    typst-live

    # PDF tool
    pdftk

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

    window-theme = auto
    window-title-font-family = Inter

    window-padding-color = extend
    window-padding-x = 6
    window-padding-y = 6
  '';

  # Yazi
  programs.yazi.enable = true;

  # Configuration for helix text editor
  programs.helix = {
    enable = true;

    # Set helix as the default editor
    defaultEditor = true;

    # Settings for helix
    settings = {
      theme = "base16_default";

      editor = {
        scroll-lines = 1;
        cursorline = true;
        completion-trigger-len = 1;
        true-color = true;
        color-modes = true;
        auto-pairs = true;
        rulers = [];
        idle-timeout = 50;
        line-number = "relative";
      };

      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };

      editor.indent-guides = {
        render = true;
        character = "▏";
      };

      editor.lsp = {
        display-messages = true;
        display-inlay-hints = true;
      };

      editor.auto-save = {
        auto-save = true;
        focus_lost = true;
        after-delay.enable = true;
        after-delay.timeout = 5000;
      };

      editor.statusline = {
        left = ["mode" "spinner" "file-name" "file-type" "total-line-numbers" "file-encoding"];
        center = [];
        right = ["selections" "primary-selection-length" "position" "position-percentage" "spacer" "diagnostics" "workspace-diagnostics" "version-control"];
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          indent = {
            tab-width = 4;
            unit = "    ";
          };
          formatter.command = lib.getExe pkgs.alejandra;
        }
        {
          name = "typst";
          auto-format = true;
          formatter.command = lib.getExe pkgs.typstyle;
        }
        {
          name = "python";
          auto-format = true;
          formatter.command = lib.getExe pkgs.black;
        }
      ];
    };

    # Install lsps with helix
    extraPackages = with pkgs; [
      marksman
      nil
      yaml-language-server
      python312Packages.python-lsp-server
      jdt-language-server
    ];
  };

  # End helix config
}
