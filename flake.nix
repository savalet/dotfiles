{
  description = "savalet's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };

  in {
    nixosConfigurations = {
      pluton = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };
        modules = [./pluton];
      };
    };
  };
}
