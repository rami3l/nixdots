{
  pkgs,
  lib,
  ...
}: let
  inherit (pkgs) stdenv;
in rec {
  programs.java = {
    enable = true;
    package = pkgs.openjdk;
  };

  home.packages = [
    pkgs.leiningen
  ];

  home.file = lib.mkIf stdenv.hostPlatform.isDarwin {
    "Library/Java/JavaVirtualMachines/openjdk.jdk".source =
      programs.java.package.bundle;
  };
}
