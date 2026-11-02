{
  lib,
  pkgs,
  ...
}: let
  inherit (pkgs) stdenv;

  fontCfg = {
    font-family = "Cascadia Code PL";
    font-size = 14;
    font-feature = "+ss01,+ss19,+ss20";
    adjust-cell-width = "-5%";

    # font-family = "Iosevka Term";
    # font-feature = "+ss05";
    # font-size = 15;

    # font-family = "Input Mono Narrow";
    # font-size = 14;
    # adjust-cell-width = "-10%";
  };

  # NOTE: Formatting borrowed from `home-manager`'s Ghostty module.
  ghosttyFormat = pkgs.formats.keyValue {
    listsAsDuplicateKeys = true;
    mkKeyValue = lib.generators.mkKeyValueDefault {} " = ";
  };
in {
  xdg.configFile."ghostty/platform-config".source = ghosttyFormat.generate "platform-config" (
    let
      inherit (fontCfg) font-size font-family;

      # NOTE: Due to DPI differences, on Linux we need a scaling factor to make
      # the font size look the same as on macOS. See:
      # <https://github.com/ghostty-org/ghostty/discussions/7743#discussioncomment-13724740>
      fontSizeFact =
        if stdenv.hostPlatform.isLinux
        then 0.75
        else 1.0;
    in
      fontCfg
      // {
        font-size = fontSizeFact * font-size;
        font-family = [
          font-family
          # Fallback for NF Symbols
          "Symbols Nerd Font"
        ];
      }
  );
}
