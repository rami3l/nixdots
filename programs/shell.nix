{
  pkgs,
  system,
  lib,
  ...
}: let
  inherit (lib) optionals;
  # TODO: Move this function to a util file so that it can be reused.
  isSystem = sys: builtins.match ".*-${sys}" system != null;
in {
  home.packages = with pkgs;
    [
      fish

      starship

      ast-grep
      bandwhich
      bat
      curl
      dust
      entr
      eza
      fd
      fzf
      glow
      htop
      hyperfine
      imagemagick
      jq
      mdbook
      mtr
      nmap
      onefetch
      ouch
      parallel
      ripgrep
      rlwrap
      shellcheck
      smartmontools
      tlrc
      tokei
      trash-cli
      typst
      # valgrind
      websocat
      wget
      xh
      yazi
      yt-dlp
      zellij
    ]
    ++ optionals (isSystem "darwin") [
      duti
      iproute2mac
      macism
      mas
      terminal-notifier
    ];
}
