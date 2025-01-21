{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    # Cool completion engine
    carapace

    # Terminal utilities
    eza
    bat
    zoxide
  ];

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };

  # Enable various utilities
  programs.eza.enable = true;
  programs.bat.enable = true;
  programs.zoxide = {
    enable = true;
    options = ["--cmd cd"];
  };
  programs.fish = {
    enable = true;

    shellInit = ''
      set fish_greeting
    '';
  };

  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      add_newline = true;

      # character = {
      #   success_symbol = "[➜](bold green)";
      #   error_symbol = "[➜](bold red)";
      # };

      # package.disabled = true;
    };
  };
}
