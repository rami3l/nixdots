{pkgs, ...}: {
  home.packages = with pkgs; [
    gitFull
    jujutsu

    bfg-repo-cleaner
    difftastic
    gh
    git-absorb
    git-credential-oauth
    gitu
    jjui
    mergiraf
    tea
  ];
}
