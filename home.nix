{util, ...}: {
  imports = [
    ./link.nix
    ./programs/fastfetch.nix
    ./programs/git.nix
    ./programs/go.nix
    ./programs/nix.nix
    ./programs/rust.nix
    ./programs/shell.nix
    ./util.nix
  ];

  home = {
    inherit (util) username homeDirectory;
    stateVersion = "26.05";
  };

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 30d";
  };

  programs.home-manager.enable = true;
}
