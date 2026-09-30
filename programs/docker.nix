{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) optionalAttrs;
  inherit (pkgs) stdenv;
in {
  services.podman =
    {enable = true;}
    // optionalAttrs stdenv.hostPlatform.isDarwin {
      useDefaultMachine = false;
      machines.podman-machine-default.autoStart = false;
    };

  home.packages = [
    pkgs.docker-compose
  ];
}
