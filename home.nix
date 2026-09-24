{
  pkgs,
  username,
  homeDirectory,
  ...
}: {
  imports = [
    ./link.nix
    ./programs/fastfetch.nix
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

  programs.home-manager.enable = true;
}
