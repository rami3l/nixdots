{
  pkgs,
  lib,
  util,
  ...
}: let
  inherit (lib) optionals;
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
    ++ optionals (util.isSystem "darwin") [
      duti
      iproute2mac
      macism
      mas
      terminal-notifier
    ];
}
