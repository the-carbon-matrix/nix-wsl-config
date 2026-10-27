let
  sources = import ./.tack;
  pkgs = import sources.nixpkgs {
    config.allowUnfree = true;
  };
  nixosSystem = import "${sources.nixpkgs}/nixos/lib/eval-config.nix";

  baseVars = {
    username = "carbon";
  };
in
  nixosSystem {
    inherit pkgs;
    specialArgs = {inherit sources baseVars;};

    modules = [
      sources.nixos-wsl.nixosModules.default
      ./nixos/configuration.nix
    ];
  }
