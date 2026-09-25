{
  pkgs,
  username,
  homeDirectory,
  ...
}: {
  imports = [
    ./link.nix
    ./programs/fastfetch.nix
    ./programs/git.nix
    ./programs/go.nix
  ];

  home = {
    inherit username homeDirectory;

    stateVersion = "26.05";

    packages = with pkgs; [
      # Nix development
      deadnix
      nixd
      statix
    ];
  };

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 30d";
  };

  programs.home-manager.enable = true;
}
