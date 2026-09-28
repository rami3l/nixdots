{
  pkgs,
  lib,
  ...
}: let
  inherit (pkgs) stdenv;
in {
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    pinentry.package = lib.mkIf stdenv.hostPlatform.isDarwin pkgs.pinentry_mac;
  };
}
