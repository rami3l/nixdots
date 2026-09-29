{const, ...}: {
  imports = [
    ./link.nix
    ./programs/erlang.nix
    ./programs/docker.nix
    ./programs/fastfetch.nix
    ./programs/git.nix
    ./programs/gnupg.nix
    ./programs/go.nix
    ./programs/java.nix
    ./programs/nix.nix
    ./programs/nvim.nix
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

  programs.home-manager.enable = true;
}
