{pkgs, ...}: {
  home.packages = with pkgs; [
    fish

    fzf
    starship
  ];
}
