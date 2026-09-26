{pkgs, ...}: {
  home.packages = with pkgs; [
    cargo-audit
    cargo-binstall
    cargo-bloat
    cargo-flamegraph
    cargo-nextest
    cargo-release
    cargo-sweep
    cargo-watch
    # cargo-valgrind
    rust-bindgen
  ];
}
