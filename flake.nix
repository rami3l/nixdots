{
  description = "My personal Nix-based dotfiles";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    homebrew = {
      url = "github:rami3l/home-manager-brew/dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rustup-src = {
      url = "github:rust-lang/rustup";
      flake = false;
    };
  };
  outputs = {
    nixpkgs,
    home-manager,
    homebrew,
    rustup-src,
    ...
  }: let
    username = "rami3l";

    mkHome = {
      system,
      homeDirectory,
    }: let
      const = {inherit username homeDirectory;};

      pkgs = nixpkgs.legacyPackages.${system}.extend (final: _prev: {
        rustup-unstable = final.callPackage ./pkgs/rustup-unstable {inherit rustup-src;};
      });
    in
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          homebrew.homeManagerModules.default
          ./home.nix
        ];
        extraSpecialArgs = {inherit const;};
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
