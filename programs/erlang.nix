{pkgs, ...}: {
  home.packages = with pkgs.beam29Packages; [
    erlang
    elixir
  ];
}
