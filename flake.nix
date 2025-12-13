{
  description = "basic flake config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    affinity-nix.url = "github:mrshmllow/affinity-nix";

    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      mangowc,
      self,
      nixpkgs,
      home-manager,
      affinity-nix,
      ...
    }:
    {

      nixosConfigurations.tomtom = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs self; };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zoomer = ./home.nix;
            home-manager.backupFileExtension = "backup";
            home.packages = [ affinity-nix.packages.x86_64-linux.v3 ];
          }
          ./NIXOSmodules/noctalia.nix
          mangowc.nixosModules.mango

        ];
      };
    };
}
