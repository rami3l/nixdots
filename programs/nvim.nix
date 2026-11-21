{pkgs, ...}: {
  home.packages = with pkgs; [
    neovim-nightly
    neovim-remote

    tree-sitter
  ];
}
