{pkgs, ...}: let
  inherit (pkgs) stdenv;
in {
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;

    defaultCacheTtl = 7200;

    pinentry.package =
      if stdenv.hostPlatform.isDarwin
      then pkgs.pinentry_mac
      else pkgs.pinentry-gnome3;
  };
}
