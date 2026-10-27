{
  pkgs,
  sources,
  baseVars,
  ...
}: {
  imports = [
    "${sources.home-manager}/nixos"
    ./docker.nix
    ./nix.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = baseVars.username;
  programs.fish.enable = true;

  users.users.${baseVars.username} = {
    isNormalUser = true;
    shell = pkgs.fish;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.users.${baseVars.username} = import ../home-manager/home.nix;

  system.stateVersion = "26.05"; # DO NOT EDIT
}
