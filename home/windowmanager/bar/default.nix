{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.noctalia.packages.${system}.default
    inputs.quickshell.packages.${system}.default
  ];
}
