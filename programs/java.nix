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

  home.file."Library/Java/JavaVirtualMachines/openjdk.jdk".
    source = lib.mkIf stdenv.hostPlatform.isDarwin programs.java.package.bundle;
}
