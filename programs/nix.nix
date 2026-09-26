{pkgs, ...}: {
  home.packages = with pkgs; [
    deadnix
    nixd
    statix
  ];
}
