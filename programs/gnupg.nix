{
  pkgs,
  lib,
  util,
  ...
}: {
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    pinentry.package = lib.mkIf (util.isSystem "darwin") pkgs.pinentry_mac;
  };
}
