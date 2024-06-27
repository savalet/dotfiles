{
  description = "savalet's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    username = "savalet";
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

  in {
    nixosConfigurations = {
      pluton = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./pluton ];
      };
    };

    homeConfigurations = {
      ${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home ];
      };
    };
  };
}
