{
  pkgs,
  sources,
  ...
}: let
  username = "carbon";
in {
  imports = [
    "${sources.home-manager}/nixos"
    ./docker.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = username;

  programs.nix-ld.enable = true;
  programs.tack.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes" "pipe-operators"];

  programs.nh = {
    enable = true;
    clean.enable = true;
  };
  environment.sessionVariables = {
    "NH_FILE" = "/home/${username}/.config/nixos/system.nix";
  };

  programs.fish.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.fish;
  };
  home-manager.useGlobalPkgs = true;
  home-manager.users.${username} = import ../home-manager/home.nix;

  environment.systemPackages = with pkgs; [
    helix
    nixd
    alejandra
  ];

  system.stateVersion = "26.05"; # DO NOT EDIT
}
