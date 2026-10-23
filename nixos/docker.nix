{pkgs, ...}: {
  wsl.docker-desktop.enable = true;
  wsl.extraBin = with pkgs; [
    {src = "${coreutils}/bin/test";}
    {src = "${coreutils}/bin/install";}
    {src = "${coreutils}/bin/mkdir";}
    {src = "${coreutils}/bin/cp";}
    {src = "${coreutils}/bin/mv";}
    {src = "${coreutils}/bin/rm";}
    {src = "${coreutils}/bin/chmod";}
    {src = "${coreutils}/bin/ln";}
    {src = "${coreutils}/bin/ls";}
    {src = "${coreutils}/bin/cat";}
    {src = "${coreutils}/bin/stat";}
    {src = "${coreutils}/bin/readlink";}
    {src = "${coreutils}/bin/uname";}
    {src = "${coreutils}/bin/sleep";}
  ];
}
