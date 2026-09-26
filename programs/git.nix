{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    jujutsu

    bfg-repo-cleaner
    delta
    gh
    git-absorb
    git-credential-oauth
    jj-starship
    jjui
    mergiraf
    tea
  ];
}
