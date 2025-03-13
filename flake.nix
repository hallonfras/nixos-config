{
  description = "Isaac Westerman's NixOS configuration";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    # NixOS official package source, unstable branch. Used in overlay
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Manages user level configuration
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Aylur's gtk shell, for widgets
    ags.url = "github:aylur/ags";

    # Zen browser flake
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    # Nix module for base16 theming
    base16.url = "github:SenchoPens/base16.nix";

    # Tinted theming colorschemes
    tt-schemes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };

    # Really cool helix colorscheme
    melange = {
      url = "github:DimitrisDimitropoulos/melange-helix";
      flake = false;
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: let
    inherit (self) outputs;
  in {
    overlays = import ./overlays {inherit inputs;};

    # Builds the configuration
    nixosConfigurations.pine = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {inherit inputs outputs;};
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./nixos/configuration.nix
        ./nixos/virtualization.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.isaac = import ./home/home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          home-manager.extraSpecialArgs = {inherit inputs outputs;};
        }
      ];
    };
  };
}
