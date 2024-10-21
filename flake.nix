{
  description = "savalet's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    Neve.url = "github:savalet/Neve";

    ecsls.url = "github:Sigmapitech/ecsls";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    username = "savalet";
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    home-manager-config = {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${username}.imports = [ ./home ];

        extraSpecialArgs = {
          inherit inputs;
        };
      };
    };

  in {
    nixosConfigurations = {
      pluton = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./pluton
          home-manager.nixosModules.home-manager
          home-manager-config
        ];
      };
    };

    homeConfigurations = {
      ${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home ];
        extraSpecialArgs = {
          inherit inputs;
        };
      };
    };
  };
}
