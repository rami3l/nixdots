{
  pkgs,
  username,
  homeDirectory,
  ...
}: {
  imports = [./link.nix];

  home = {
    inherit username homeDirectory;

    stateVersion = "26.05";

    packages = with pkgs; [
      deadnix
      statix
    ];
  };

  programs.home-manager.enable = true;
}
