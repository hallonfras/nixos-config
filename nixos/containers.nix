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
  };

  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    lazydocker
  ];
}
