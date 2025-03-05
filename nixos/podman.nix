{
  config,
  pkgs,
  ...
}: {
  # Add my user to the docker group
  users.users.isaac.extraGroups = ["docker"];

  # Enable common container config files in /etc/containers
  virtualisation.containers.enable = true;
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };

    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = false;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [
    podman
    podman-tui
    podman-desktop

    docker
  ];
}
