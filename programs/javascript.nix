{pkgs, ...}: {
  programs.pnpm.enable = true;

  home.packages = [
    pkgs.nodejs
  ];
}
