{
  pkgs,
  lib,
  ...
}: let
  inherit (pkgs) stdenv;
in {
  i18n.inputMethod = lib.mkIf stdenv.hostPlatform.isLinux {
    enable = true;
    type = "fcitx5";

    fcitx5 = {
      addons = with pkgs; [
        fcitx5-pinyin-zhwiki
        qt6Packages.fcitx5-chinese-addons
        qt6Packages.fcitx5-configtool
      ];
    };
  };
}
