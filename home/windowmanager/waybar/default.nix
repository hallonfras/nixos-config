{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 28;
        margin = "0";

        "battery" = {
          interval = 10;
          states = {
            "warning" = 30;
            "critical" = 15;
          };
          format = "<U+F0E7>  {icon}  {capacity}%";
          format-discharging = "{icon}  {capacity}%";
          format-icons = [
            "<U+F244>"
            "<U+F243>"
            "<U+F242>"
            "<U+F241>"
            "<U+F240>"
          ];
          tooltip = true;
        };

        modules-left = ["niri/workspaces" "niri/window"];
        modules-center = [];
        modules-right = ["pipewire" "battery" "clock#time"];
      };
    };

    style = ''
      @import "colors.css";

      * {
        border: none;
        font-family: Inter;
        font-size: 13px;
      }
      window#waybar {
        background: @base00;
        color: @base05;
      }

      #workspaces button.active {
        background: @base09;
        color: @base05;
      }

      #workspaces button {
        color: @base03;
      }

      #clock {
        padding-left: 10px;
        padding-right: 10px;
      }
    '';
  };
}
