{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
  ];

  imports = [inputs.sherlock.homeModules.default];

  programs.sherlock.enable = true;
  programs.sherlock.settings = null;
}
