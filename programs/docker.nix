{pkgs, ...}: {
  services.podman = {
    enable = true;
    useDefaultMachine = false;
    machines.podman-machine-default.autoStart = false;
  };

  home.packages = [
    pkgs.docker-compose
  ];
}
