{
  pkgs,
  const,
  ...
}: let
  inherit (pkgs) stdenv;
in {
  imports = [
    ./link.nix
    ./programs/bundle.nix
    ./programs/docker.nix
    ./programs/erlang.nix
    ./programs/fastfetch.nix
    ./programs/font.nix
    ./programs/ghostty.nix
    ./programs/git.nix
    ./programs/gnupg.nix
    ./programs/go.nix
    ./programs/i18n.nix
    ./programs/java.nix
    ./programs/javascript.nix
    ./programs/nix.nix
    ./programs/nvim.nix
    ./programs/python.nix
    ./programs/rust.nix
    ./programs/shell.nix
    ./programs/zig.nix
  ];

  home = {
    inherit (const) username homeDirectory;
    stateVersion = "26.05";
  };

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 30d";
  };
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
  targets.genericLinux.enable = stdenv.hostPlatform.isLinux;
}
