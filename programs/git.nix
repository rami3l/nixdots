{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    jujutsu

    bfg-repo-cleaner
    delta
    gh
    git-absorb
    git-credential-oauth
    gitu
    jj-starship
    jjui
    mergiraf
    tea
  ];
}
