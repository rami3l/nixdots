{const, ...}: {
  imports = [
    ./link.nix
    ./programs/erlang.nix
    ./programs/docker.nix
    ./programs/fastfetch.nix
    ./programs/font.nix
    ./programs/git.nix
    ./programs/gnupg.nix
    ./programs/go.nix
    ./programs/homebrew.nix
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
}
