{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # Cool wallpaper colorizer
    gowall
  ];

  # scheme = (config.lib.base16.mkSchemeAttrs "${inputs.tt-schemes}/base16/grayscale-light.yaml").override {
  #   scheme = "E-ink inspired theme (stolen from https://github.com/alexxGmZ/e-ink.nvim)";
  #   base00 = "CCCCCC";
  #   base01 = "C2C2C2";
  #   base02 = "B8B8B8";
  #   base03 = "AEAEAE";
  #   base04 = "A4A4A4";
  #   base05 = "9A9A9A";
  #   base06 = "909090";
  #   base07 = "868686";
  #   base08 = "7C7C7C";
  #   base09 = "727272";
  #   base0A = "686868";
  #   base0B = "5E5E5E";
  #   base0C = "545454";
  #   base0D = "4A4A4A";
  #   base0E = "474747";
  #   base0F = "333333";
  # };

  scheme = "https://github.com/EdenEast/nightfox.nvim/blob/main/extra/dawnfox/base16.yaml"

  # Theme ghostty
  xdg.configFile."ghostty/colors".text = with config.scheme; ''
    # Color palette
    palette = 0=#${base00}
    palette = 1=#${base08}
    palette = 2=#${base0B}
    palette = 3=#${base0A}
    palette = 4=#${base0D}
    palette = 5=#${base0E}
    palette = 6=#${base0C}
    palette = 7=#${base05}
    palette = 8=#${base02}
    palette = 9=#${base08}
    palette = 10=#${base0B}
    palette = 11=#${base0A}
    palette = 12=#${base0D}
    palette = 13=#${base0E}
    palette = 14=#${base0C}
    palette = 15=#${base07}
    palette = 16=#${base09}
    palette = 17=#${base0F}
    palette = 18=#${base01}
    palette = 19=#${base02}
    palette = 20=#${base04}
    palette = 21=#${base06}

    # Foreground & background colors
    background = #${base00}
    foreground = #${base05}
    cursor-color = #${base05}
    selection-background = #${base02}
    selection-foreground = #${base05}
  '';

  # Theme ags
  home.file.".nixos-config/home/windowmanager/ags/config/colors.scss".text = with config.scheme; ''
    $base00: #${base00};
    $base01: #${base01};
    $base02: #${base02};
    $base03: #${base03};
    $base04: #${base04};
    $base05: #${base05};
    $base06: #${base06};
    $base07: #${base07};
    $base08: #${base08};
    $base09: #${base09};
    $base0A: #${base0A};
    $base0B: #${base0B};
    $base0C: #${base0C};
    $base0D: #${base0D};
    $base0E: #${base0E};
    $base0F: #${base0F};
  '';

  # Theme Zathura
  xdg.configFile."zathura/zathurarc".text = with config.scheme; ''
    set default-bg                  "#${base00}"
    set default-fg                  "#${base01}"

    set statusbar-fg                "#${base04}"
    set statusbar-bg                "#${base02}"

    set inputbar-bg                 "#${base00}"
    set inputbar-fg                 "#${base07}"

    set notification-bg             "#${base00}"
    set notification-fg             "#${base07}"

    set notification-error-bg       "#${base00}"
    set notification-error-fg       "#${base08}"

    set notification-warning-bg     "#${base00}"
    set notification-warning-fg     "#${base08}"

    set highlight-color             "#${base0A}"
    set highlight-active-color      "#${base0D}"

    set completion-bg               "#${base01}"
    set completion-fg               "#${base0D}"

    set completion-highlight-fg     "#${base07}"
    set completion-highlight-bg     "#${base0D}"

    set recolor-lightcolor          "#${base00}"
    set recolor-darkcolor           "#${base06}"

  '';

  # Generate GTK.css
  xdg.configFile."gtk-4.0/gtk.css".text = ''@import 'colors.css';'';
  xdg.configFile."gtk-3.0/gtk.css".text = ''@import 'colors.css';'';

  # Theme GTK 3.0
  xdg.configFile."gtk-3.0/colors.css".text = with config.scheme; ''
    @define-color accent_color #${base0D};
    @define-color accent_bg_color #${base0D};
    @define-color accent_fg_color #${base00};
    @define-color destructive_color #${base08};
    @define-color destructive_bg_color #${base08};
    @define-color destructive_fg_color #${base00};
    @define-color success_color #${base0B};
    @define-color success_bg_color #${base0B};
    @define-color success_fg_color #${base00};
    @define-color warning_color #${base0E};
    @define-color warning_bg_color #${base0E};
    @define-color warning_fg_color #${base00};
    @define-color error_color #${base08};
    @define-color error_bg_color #${base08};
    @define-color error_fg_color #${base00};
    @define-color window_bg_color #${base00};
    @define-color window_fg_color #${base05};
    @define-color view_bg_color #${base00};
    @define-color view_fg_color #${base05};
    @define-color headerbar_bg_color #${base01};
    @define-color headerbar_fg_color #${base05};
    @define-color headerbar_border_color alpha(#${base01}, 0.7);
    @define-color headerbar_backdrop_color @window_bg_color;
    @define-color headerbar_shade_color rgba(0, 0, 0, 0.07);
    @define-color headerbar_darker_shade_color rgba(0, 0, 0, 0.07);
    @define-color sidebar_bg_color #${base01};
    @define-color sidebar_fg_color #${base05};
    @define-color sidebar_backdrop_color @window_bg_color;
    @define-color sidebar_shade_color rgba(0, 0, 0, 0.07);
    @define-color secondary_sidebar_bg_color @sidebar_bg_color;
    @define-color secondary_sidebar_fg_color @sidebar_fg_color;
    @define-color secondary_sidebar_backdrop_color @sidebar_backdrop_color;
    @define-color secondary_sidebar_shade_color @sidebar_shade_color;
    @define-color card_bg_color #${base01};
    @define-color card_fg_color #${base05};
    @define-color card_shade_color rgba(0, 0, 0, 0.07);
    @define-color dialog_bg_color #${base01};
    @define-color dialog_fg_color #${base05};
    @define-color popover_bg_color #${base01};
    @define-color popover_fg_color #${base05};
    @define-color popover_shade_color rgba(0, 0, 0, 0.07);
    @define-color shade_color rgba(0, 0, 0, 0.07);
    @define-color scrollbar_outline_color #${base02};
    @define-color blue_1 #${base0D};
    @define-color blue_2 #${base0D};
    @define-color blue_3 #${base0D};
    @define-color blue_4 #${base0D};
    @define-color blue_5 #${base0D};
    @define-color green_1 #${base0B};
    @define-color green_2 #${base0B};
    @define-color green_3 #${base0B};
    @define-color green_4 #${base0B};
    @define-color green_5 #${base0B};
    @define-color yellow_1 #${base0A};
    @define-color yellow_2 #${base0A};
    @define-color yellow_3 #${base0A};
    @define-color yellow_4 #${base0A};
    @define-color yellow_5 #${base0A};
    @define-color orange_1 #${base09};
    @define-color orange_2 #${base09};
    @define-color orange_3 #${base09};
    @define-color orange_4 #${base09};
    @define-color orange_5 #${base09};
    @define-color red_1 #${base08};
    @define-color red_2 #${base08};
    @define-color red_3 #${base08};
    @define-color red_4 #${base08};
    @define-color red_5 #${base08};
    @define-color purple_1 #${base0E};
    @define-color purple_2 #${base0E};
    @define-color purple_3 #${base0E};
    @define-color purple_4 #${base0E};
    @define-color purple_5 #${base0E};
    @define-color brown_1 #${base0F};
    @define-color brown_2 #${base0F};
    @define-color brown_3 #${base0F};
    @define-color brown_4 #${base0F};
    @define-color brown_5 #${base0F};
    @define-color light_1 #${base01};
    @define-color light_2 #${base01};
    @define-color light_3 #${base01};
    @define-color light_4 #${base01};
    @define-color light_5 #${base01};
    @define-color dark_1 #${base01};
    @define-color dark_2 #${base01};
    @define-color dark_3 #${base01};
    @define-color dark_4 #${base01};
    @define-color dark_5 #${base01}$;
  '';

  # Theme GTK 4.0
  xdg.configFile."gtk-4.0/colors.css".text = with config.scheme; ''
    @define-color accent_color #${base0D};
    @define-color accent_bg_color #${base0D};
    @define-color accent_fg_color #${base00};
    @define-color destructive_color #${base08};
    @define-color destructive_bg_color #${base08};
    @define-color destructive_fg_color #${base00};
    @define-color success_color #${base0B};
    @define-color success_bg_color #${base0B};
    @define-color success_fg_color #${base00};
    @define-color warning_color #${base0E};
    @define-color warning_bg_color #${base0E};
    @define-color warning_fg_color #${base00};
    @define-color error_color #${base08};
    @define-color error_bg_color #${base08};
    @define-color error_fg_color #${base00};
    @define-color window_bg_color #${base00};
    @define-color window_fg_color #${base05};
    @define-color view_bg_color #${base00};
    @define-color view_fg_color #${base05};
    @define-color headerbar_bg_color #${base01};
    @define-color headerbar_fg_color #${base05};
    @define-color headerbar_border_color alpha(#${base01}, 0.7);
    @define-color headerbar_backdrop_color @window_bg_color;
    @define-color headerbar_shade_color rgba(0, 0, 0, 0.07);
    @define-color headerbar_darker_shade_color rgba(0, 0, 0, 0.07);
    @define-color sidebar_bg_color #${base01};
    @define-color sidebar_fg_color #${base05};
    @define-color sidebar_backdrop_color @window_bg_color;
    @define-color sidebar_shade_color rgba(0, 0, 0, 0.07);
    @define-color secondary_sidebar_bg_color @sidebar_bg_color;
    @define-color secondary_sidebar_fg_color @sidebar_fg_color;
    @define-color secondary_sidebar_backdrop_color @sidebar_backdrop_color;
    @define-color secondary_sidebar_shade_color @sidebar_shade_color;
    @define-color card_bg_color #${base01};
    @define-color card_fg_color #${base05};
    @define-color card_shade_color rgba(0, 0, 0, 0.07);
    @define-color dialog_bg_color #${base01};
    @define-color dialog_fg_color #${base05};
    @define-color popover_bg_color #${base01};
    @define-color popover_fg_color #${base05};
    @define-color popover_shade_color rgba(0, 0, 0, 0.07);
    @define-color shade_color rgba(0, 0, 0, 0.07);
    @define-color scrollbar_outline_color #${base02};
    @define-color blue_1 #${base0D};
    @define-color blue_2 #${base0D};
    @define-color blue_3 #${base0D};
    @define-color blue_4 #${base0D};
    @define-color blue_5 #${base0D};
    @define-color green_1 #${base0B};
    @define-color green_2 #${base0B};
    @define-color green_3 #${base0B};
    @define-color green_4 #${base0B};
    @define-color green_5 #${base0B};
    @define-color yellow_1 #${base0A};
    @define-color yellow_2 #${base0A};
    @define-color yellow_3 #${base0A};
    @define-color yellow_4 #${base0A};
    @define-color yellow_5 #${base0A};
    @define-color orange_1 #${base09};
    @define-color orange_2 #${base09};
    @define-color orange_3 #${base09};
    @define-color orange_4 #${base09};
    @define-color orange_5 #${base09};
    @define-color red_1 #${base08};
    @define-color red_2 #${base08};
    @define-color red_3 #${base08};
    @define-color red_4 #${base08};
    @define-color red_5 #${base08};
    @define-color purple_1 #${base0E};
    @define-color purple_2 #${base0E};
    @define-color purple_3 #${base0E};
    @define-color purple_4 #${base0E};
    @define-color purple_5 #${base0E};
    @define-color brown_1 #${base0F};
    @define-color brown_2 #${base0F};
    @define-color brown_3 #${base0F};
    @define-color brown_4 #${base0F};
    @define-color brown_5 #${base0F};
    @define-color light_1 #${base01};
    @define-color light_2 #${base01};
    @define-color light_3 #${base01};
    @define-color light_4 #${base01};
    @define-color light_5 #${base01};
    @define-color dark_1 #${base01};
    @define-color dark_2 #${base01};
    @define-color dark_3 #${base01};
    @define-color dark_4 #${base01};
    @define-color dark_5 #${base01}$;
  '';

  xdg.configFile."niri/config.kdl".text = with config.scheme; ''
      // This config is in the KDL format: https://kdl.dev
    // "/-" comments out the following node.
    // Check the wiki for a full description of the configuration:
    // https://github.com/YaLTeR/niri/wiki/Configuration:-Overview

    // Input device configuration.
    // Find the full list of options on the wiki:
    // https://github.com/YaLTeR/niri/wiki/Configuration:-Input
    environment {
        DISPLAY ":0"
        ELECTRON_OZONE_PLATFORM_HINT "wayland"
    }

    input {
        keyboard {
            xkb {
                // You can set rules, model, layout, variant and options.
                // For more information, see xkeyboard-config(7).

                // For example:
    		layout "se"
                // options "grp:win_space_toggle,compose:ralt,ctrl:nocaps"
            }
        }

        // Next sections include libinput settings.
        // Omitting settings disables them, or leaves them at their default values.
        touchpad {
            // off
            tap
            // dwt
            // dwtp
            natural-scroll
            // accel-speed 0.2
            // accel-profile "flat"
            // scroll-method "two-finger"
            // disabled-on-external-mouse
        }

        mouse {
            // off
            // natural-scroll
            // accel-speed 0.2
            // accel-profile "flat"
            // scroll-method "no-scroll"
        }

        // Uncomment this to make the mouse warp to the center of newly focused windows.
        // warp-mouse-to-focus

        // Focus windows and outputs automatically when moving the mouse into them.
        // Setting max-scroll-amount="0%" makes it work only on windows already fully on screen.
        // focus-follows-mouse max-scroll-amount="0%"
    }

    // You can configure outputs by their name, which you can find
    // by running `niri msg outputs` while inside a niri instance.
    // The built-in laptop monitor is usually called "eDP-1".
    // Find more information on the wiki:
    // https://github.com/YaLTeR/niri/wiki/Configuration:-Outputs
    // Remember to uncomment the node by removing "/-"!
    /-output "eDP-1" {
        // Uncomment this line to disable this output.
        // off

        // Resolution and, optionally, refresh rate of the output.
        // The format is "<width>x<height>" or "<width>x<height>@<refresh rate>".
        // If the refresh rate is omitted, niri will pick the highest refresh rate
        // for the resolution.
        // If the mode is omitted altogether or is invalid, niri will pick one automatically.
        // Run `niri msg outputs` while inside a niri instance to list all outputs and their modes.
        mode "1920x1080@120.030"

        // You can use integer or fractional scale, for example use 1.5 for 150% scale.
        scale 2

        // Transform allows to rotate the output counter-clockwise, valid values are:
        // normal, 90, 180, 270, flipped, flipped-90, flipped-180 and flipped-270.
        transform "normal"

        // Position of the output in the global coordinate space.
        // This affects directional monitor actions like "focus-monitor-left", and cursor movement.
        // The cursor can only move between directly adjacent outputs.
        // Output scale and rotation has to be taken into account for positioning:
        // outputs are sized in logical, or scaled, pixels.
        // For example, a 3840×2160 output with scale 2.0 will have a logical size of 1920×1080,
        // so to put another output directly adjacent to it on the right, set its x to 1920.
        // If the position is unset or results in an overlap, the output is instead placed
        // automatically.
        position x=1280 y=0
    }

    // Settings that influence how windows are positioned and sized.
    // Find more information on the wiki:
    // https://github.com/YaLTeR/niri/wiki/Configuration:-Layout
    layout {
        // Set gaps around windows in logical pixels.
        gaps 11

        // When to center a column when changing focus, options are:
        // - "never", default behavior, focusing an off-screen column will keep at the left
        //   or right edge of the screen.
        // - "always", the focused column will always be centered.
        // - "on-overflow", focusing a column will center it if it doesn't fit
        //   together with the previously focused column.
        center-focused-column "never"

        // You can customize the widths that "switch-preset-column-width" (Mod+R) toggles between.
        preset-column-widths {
            // Proportion sets the width as a fraction of the output width, taking gaps into account.
            // For example, you can perfectly fit four windows sized "proportion 0.25" on an output.
            // The default preset widths are 1/3, 1/2 and 2/3 of the output.
            proportion 0.33333
            proportion 0.5
            proportion 0.66667

            // Fixed sets the width in logical pixels exactly.
            // fixed 1920
        }

        // You can also customize the heights that "switch-preset-window-height" (Mod+Shift+R) toggles between.
        // preset-window-heights { }

        // You can change the default width of the new windows.
        default-column-width { proportion 0.5; }
        // If you leave the brackets empty, the windows themselves will decide their initial width.
        // default-column-width {}

        // By default focus ring and border are rendered as a solid background rectangle
        // behind windows. That is, they will show up through semitransparent windows.
        // This is because windows using client-side decorations can have an arbitrary shape.
        //
        // If you don't like that, you should uncomment `prefer-no-csd` below.
        // Niri will draw focus ring and border *around* windows that agree to omit their
        // client-side decorations.
        //
        // Alternatively, you can override it with a window rule called
        // `draw-border-with-background`.
        focus-ring {
    	off
        }

        border {
            // The settings are the same as for the focus ring.
            // If you enable the border, you probably want to disable the focus ring.
            // off

            width 1
            active-color "#${base09}"
            inactive-color "#${base03}"

        }

        shadow {
            on
            softness 30
            spread 5
            offset x=0 y=5
            draw-behind-window true
            color "#00000070"
            inactive-color "#00000054"
        }

        // Struts shrink the area occupied by windows, similarly to layer-shell panels.
        // You can think of them as a kind of outer gaps. They are set in logical pixels.
        // Left and right struts will cause the next window to the side to always be visible.
        // Top and bottom struts will simply add outer gaps in addition to the area occupied by
        // layer-shell panels and regular gaps.
        struts {
            // left 12
            // right 12
            // top 12
            // bottom 12
        }
    }

    // Add lines like this to spawn processes at startup.
    // Note that running niri as a session supports xdg-desktop-autostart,
    // which may be more convenient to use.
    // See the binds section below for more spawn examples.

    // Uncomment this line to ask the clients to omit their client-side decorations if possible.
    // If the client will specifically ask for CSD, the request will be honored.
    // Additionally, clients will be informed that they are tiled, removing some rounded corners.
    prefer-no-csd

    // You can change the path where screenshots are saved.
    // A ~ at the front will be expanded to the home directory.
    // The path is formatted with strftime(3) to give you the screenshot date and time.
    screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

    // You can also set this to null to disable saving screenshots to disk.
    // screenshot-path null

    // Animation settings.
    // The wiki explains how to configure individual animations:
    // https://github.com/YaLTeR/niri/wiki/Configuration:-Animations
    animations {
        // Uncomment to turn off all animations.
        // off

        // Slow down all animations by this factor. Values below 1 speed them up instead.
        // slowdown 3.0
    }

    // Window rules let you adjust behavior for individual windows.
    // Find more information on the wiki:
    // https://github.com/YaLTeR/niri/wiki/Configuration:-Window-Rules

    window-rule {
        // This regular expression is intentionally made as specific as possible,
        // since this is the default config, and we want no false positives.
        // You can get away with just app-id="wezterm" if you want.
        match app-id=r#"^org\.wezfurlong\.wezterm$"#
        default-column-width {}
    }


    window-rule {
        draw-border-with-background false
        geometry-corner-radius 5
        clip-to-geometry true
    }

    // Autostarts
    spawn-at-startup "swww-daemon"
    spawn-at-startup "swww restore"
    spawn-at-startup "xwayland-satellite"
    spawn-at-startup "ags" "run" "--gtk4"


    // Example: block out two password managers from screen capture.
    // (This example rule is commented out with a "/-" in front.)
    /-window-rule {
        match app-id=r#"^org\.keepassxc\.KeePassXC$"#
        match app-id=r#"^org\.gnome\.World\.Secrets$"#

        block-out-from "screen-capture"

        // Use this instead if you want them visible on third-party screenshot tools.
        // block-out-from "screencast"
    }

    binds {
        // Keys consist of modifiers separated by + signs, followed by an XKB key name
        // in the end. To find an XKB name for a particular key, you may use a program
        // like wev.
        //
        // "Mod" is a special modifier equal to Super when running on a TTY, and to Alt
        // when running as a winit window.
        //
        // Most actions that you can bind here can also be invoked programmatically with
        // `niri msg action do-something`.

        //brightness-controls
        XF86MonBrightnessUp { spawn "bash" "-c"  "xbacklight -inc 10"; }
        XF86MonBrightnessDown   { spawn "bash" "-c" "xbacklight -dec 10"; }

        Mod+Shift+N { spawn "ags" "run" "--gtk4"; }

        // Mod-Shift-/, which is usually the same as Mod-?,
        // shows a list of important hotkeys.
        Mod+Shift+question { show-hotkey-overlay; }

        // Suggested binds for running programs: terminal, app launcher, screen locker.
        Mod+Return { spawn "ghostty"; }
        Mod+D { spawn "walker"; }
        Super+Alt+L { spawn "swaylock"; }

        // You can also use a shell. Do this if you need pipes, multiple commands, etc.
        // Note: the entire command goes as a single argument in the end.
        // Mod+T { spawn "bash" "-c" "notify-send hello && exec alacritty"; }

        // Example volume keys mappings for PipeWire & WirePlumber.
        // The allow-when-locked=true property makes them work even when the session is locked.
        XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+"; }
        XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"; }
        XF86AudioMute        allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
        XF86AudioMicMute     allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }

        Mod+Q { close-window; }

        Mod+Left  { focus-column-left; }
        Mod+Down  { focus-window-down; }
        Mod+Up    { focus-window-up; }
        Mod+Right { focus-column-right; }
        Mod+H     { focus-column-left; }
        Mod+J     { focus-window-down; }
        Mod+K     { focus-window-up; }
        Mod+L     { focus-column-right; }

        Mod+Ctrl+Left  { move-column-left; }
        Mod+Ctrl+Down  { move-window-down; }
        Mod+Ctrl+Up    { move-window-up; }
        Mod+Ctrl+Right { move-column-right; }
        Mod+Ctrl+H     { move-column-left; }
        Mod+Ctrl+J     { move-window-down; }
        Mod+Ctrl+K     { move-window-up; }
        Mod+Ctrl+L     { move-column-right; }

        // Alternative commands that move across workspaces when reaching
        // the first or last window in a column.
        // Mod+J     { focus-window-or-workspace-down; }
        // Mod+K     { focus-window-or-workspace-up; }
        // Mod+Ctrl+J     { move-window-down-or-to-workspace-down; }
        // Mod+Ctrl+K     { move-window-up-or-to-workspace-up; }

        Mod+Home { focus-column-first; }
        Mod+End  { focus-column-last; }
        Mod+Ctrl+Home { move-column-to-first; }
        Mod+Ctrl+End  { move-column-to-last; }

        Mod+Shift+Left  { focus-monitor-left; }
        Mod+Shift+Down  { focus-monitor-down; }
        Mod+Shift+Up    { focus-monitor-up; }
        Mod+Shift+Right { focus-monitor-right; }
        Mod+Shift+H     { focus-monitor-left; }
        Mod+Shift+J     { focus-monitor-down; }
        Mod+Shift+K     { focus-monitor-up; }
        Mod+Shift+L     { focus-monitor-right; }

        Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
        Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }

        // Alternatively, there are commands to move just a single window:
        // Mod+Shift+Ctrl+Left  { move-window-to-monitor-left; }
        // ...

        // And you can also move a whole workspace to another monitor:
        // Mod+Shift+Ctrl+Left  { move-workspace-to-monitor-left; }
        // ...

        Mod+Page_Down      { focus-workspace-down; }
        Mod+Page_Up        { focus-workspace-up; }
        Mod+U              { focus-workspace-down; }
        Mod+I              { focus-workspace-up; }
        Mod+Ctrl+Page_Down { move-column-to-workspace-down; }
        Mod+Ctrl+Page_Up   { move-column-to-workspace-up; }
        Mod+Ctrl+U         { move-column-to-workspace-down; }
        Mod+Ctrl+I         { move-column-to-workspace-up; }

        // Alternatively, there are commands to move just a single window:
        // Mod+Ctrl+Page_Down { move-window-to-workspace-down; }
        // ...

        Mod+Shift+Page_Down { move-workspace-down; }
        Mod+Shift+Page_Up   { move-workspace-up; }
        Mod+Shift+U         { move-workspace-down; }
        Mod+Shift+I         { move-workspace-up; }

        // You can bind mouse wheel scroll ticks using the following syntax.
        // These binds will change direction based on the natural-scroll setting.
        //
        // To avoid scrolling through workspaces really fast, you can use
        // the cooldown-ms property. The bind will be rate-limited to this value.
        // You can set a cooldown on any bind, but it's most useful for the wheel.
        Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
        Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
        Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
        Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

        Mod+WheelScrollRight      { focus-column-right; }
        Mod+WheelScrollLeft       { focus-column-left; }
        Mod+Ctrl+WheelScrollRight { move-column-right; }
        Mod+Ctrl+WheelScrollLeft  { move-column-left; }

        // Usually scrolling up and down with Shift in applications results in
        // horizontal scrolling; these binds replicate that.
        Mod+Shift+WheelScrollDown      { focus-column-right; }
        Mod+Shift+WheelScrollUp        { focus-column-left; }
        Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
        Mod+Ctrl+Shift+WheelScrollUp   { move-column-left; }

        // Similarly, you can bind touchpad scroll "ticks".
        // Touchpad scrolling is continuous, so for these binds it is split into
        // discrete intervals.
        // These binds are also affected by touchpad's natural-scroll, so these
        // example binds are "inverted", since we have natural-scroll enabled for
        // touchpads by default.
        // Mod+TouchpadScrollDown { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.02+"; }
        // Mod+TouchpadScrollUp   { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.02-"; }

        // You can refer to workspaces by index. However, keep in mind that
        // niri is a dynamic workspace system, so these commands are kind of
        // "best effort". Trying to refer to a workspace index bigger than
        // the current workspace count will instead refer to the bottommost
        // (empty) workspace.
        //
        // For example, with 2 workspaces + 1 empty, indices 3, 4, 5 and so on
        // will all refer to the 3rd workspace.
        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }
        Mod+Ctrl+1 { move-column-to-workspace 1; }
        Mod+Ctrl+2 { move-column-to-workspace 2; }
        Mod+Ctrl+3 { move-column-to-workspace 3; }
        Mod+Ctrl+4 { move-column-to-workspace 4; }
        Mod+Ctrl+5 { move-column-to-workspace 5; }
        Mod+Ctrl+6 { move-column-to-workspace 6; }
        Mod+Ctrl+7 { move-column-to-workspace 7; }
        Mod+Ctrl+8 { move-column-to-workspace 8; }
        Mod+Ctrl+9 { move-column-to-workspace 9; }

        // Alternatively, there are commands to move just a single window:
        // Mod+Ctrl+1 { move-window-to-workspace 1; }

        // Switches focus between the current and the previous workspace.
        // Mod+Tab { focus-workspace-previous; }

        Mod+Comma  { consume-window-into-column; }
        Mod+Period { expel-window-from-column; }

        // There are also commands that consume or expel a single window to the side.
        Mod+BracketLeft  { consume-or-expel-window-left; }
        Mod+BracketRight { consume-or-expel-window-right; }

        Mod+R { switch-preset-column-width; }
        Mod+Shift+R { switch-preset-window-height; }
        Mod+Ctrl+R { reset-window-height; }
        Mod+F { maximize-column; }
        Mod+Shift+F { fullscreen-window; }
        Mod+C { center-column; }

        // Finer width adjustments.
        // This command can also:
        // * set width in pixels: "1000"
        // * adjust width in pixels: "-5" or "+5"
        // * set width as a percentage of screen width: "25%"
        // * adjust width as a percentage of screen width: "-10%" or "+10%"
        // Pixel sizes use logical, or scaled, pixels. I.e. on an output with scale 2.0,
        // set-column-width "100" will make the column occupy 200 physical screen pixels.
        Mod+Minus { set-column-width "-10%"; }
        Mod+Plus { set-column-width "+10%"; }

        // Finer height adjustments when in column with other windows.
        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+Plus { set-window-height "+10%"; }

        // Actions to switch layouts.
        // Note: if you uncomment these, make sure you do NOT have
        // a matching layout switch hotkey configured in xkb options above.
        // Having both at once on the same hotkey will break the switching,
        // since it will switch twice upon pressing the hotkey (once by xkb, once by niri).
        // Mod+Space       { switch-layout "next"; }
        // Mod+Shift+Space { switch-layout "prev"; }

        Print { screenshot; }
        Ctrl+Print { screenshot-screen; }
        Alt+Print { screenshot-window; }

        // The quit action will show a confirmation dialog to avoid accidental exits.
        Mod+Shift+E { quit; }

        // Powers off the monitors. To turn them back on, do any input like
        // moving the mouse or pressing any other key.
        Mod+Shift+P { power-off-monitors; }
    }
  '';
}
