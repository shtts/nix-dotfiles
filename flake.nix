{
  description = "Home Manager configuration of zoomer";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-blender.url = "github:nixos/nixpkgs/81b970640e56a5c07a336d2c05018b0c9bf57a51";

  };

  outputs =
    { nixpkgs, home-manager, nixpkgs-blender, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-blender = nixpkgs-blender.legacyPackages.${system};
    in
    {
      homeConfigurations."zoomer" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { 
	pkgs-blender = pkgs-blender;
	inherit inputs; };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
