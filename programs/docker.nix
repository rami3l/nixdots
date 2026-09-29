{pkgs, ...}: {
  services.podman = {
    enable = true;
    machines.podman-machine-default.autoStart = false;
  };

  home.packages = [
    pkgs.docker-compose
  ];
}
