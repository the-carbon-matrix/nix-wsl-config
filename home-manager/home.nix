{pkgs, ...}: {
  home.packages = [];
  programs.fish.enable = true;

  programs.git.enable = true;
  programs.gh.enable = true;

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "26.05";
}
