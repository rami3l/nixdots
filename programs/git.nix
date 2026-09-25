{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    jujutsu

    delta
    jj-starship
    jjui
    mergiraf
  ];
}
