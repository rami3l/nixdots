{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    jujutsu

    bfg-repo-cleaner
    difftastic
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
