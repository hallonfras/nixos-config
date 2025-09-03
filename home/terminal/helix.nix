{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    # Code formatters
    dprint
    alejandra

    # Cool Nice document tool
    unstable.typst
    tinymist
    typstyle
    typst-live
  ];

  # Configuration for helix text editor
  programs.helix = {
    enable = true;

    # Set helix as the default editor
    defaultEditor = true;

    # Settings for helix
    settings = {
      theme = "monokai_pro";

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
          soft-wrap.enable = true;
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
