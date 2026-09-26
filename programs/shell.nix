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
      ffmpeg
      fzf
      ghostscript
      glow
      gnupg
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
      resvg
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
      coreutils-prefixed
      duti
      iproute2mac
      macism
      mas
      pinentry_mac
      terminal-notifier
    ];

  home.file.".gnupg/gpg-agent.conf".text =
    if util.isSystem "darwin"
    then ''
      pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
    ''
    else "";
}
