{
  pkgs,
  baseVars,
  sources,
  ...
}: {
  programs.nix-ld.enable = true;
  programs.tack = {
    enable = true;
    package = sources.tack.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };

  nix.settings.experimental-features = ["nix-command" "flakes" "pipe-operators"];

  nix.channel.enable = false;
  environment.etc = {
    "nixos/nixpkgs".source = builtins.storePath pkgs.path;
  };
  nix.settings.nix-path = [
    "nixpkgs=${sources.nixpkgs}"
  ];

  # make `nix run nixpkgs#nixpkgs` use the same nixpkgs as the one used by nixos.
  nix.registry.nixpkgs.to = {
    type = "path";
    path = sources.nixpkgs;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
  };
  environment.sessionVariables = {
    "NH_FILE" = "/home/${baseVars.username}/.config/nixos/system.nix";
  };

  environment.systemPackages = with pkgs; [
    nixd
    statix
    alejandra
    manix
    nix-inspect
  ];
}
