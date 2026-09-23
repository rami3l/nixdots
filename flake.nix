{
  description = "My personal Nix-based dotfiles";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    username = "rami3l";

    mkHome = {
      system,
      homeDirectory,
    }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [./home.nix];
        extraSpecialArgs = {inherit username system homeDirectory;};
      };
  in {
    homeConfigurations = {
      macos = mkHome {
        system = "aarch64-darwin";
        homeDirectory = "/Users/${username}";
      };
      linux = mkHome {
        system = "x86_64-linux";
        homeDirectory = "/home/${username}";
      };
    };
  };
}
