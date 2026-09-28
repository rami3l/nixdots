{
  pkgs,
  lib,
  util,
  ...
}: let
  inherit (lib) optionals;
in {
  # HACK: Actually, it seems to work great on darwin.
  # See: <https://github.com/NixOS/nixpkgs/blob/7a0f122f5090cf4c2ade2a13a0e229d4e19ba71f/pkgs/shells/fish/plugins/fzf-fish.nix#L69>
  nixpkgs.config.problems.handlers."fzf.fish".broken = "warn";

  home.packages = with pkgs;
    [
      fish
      fishPlugins.bass
      fishPlugins.done
      fishPlugins.fzf-fish

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
      terminal-notifier
    ];
}
