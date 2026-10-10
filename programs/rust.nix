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
    cmake
    # cargo-valgrind
    dioxus-cli
    kache
    rust-bindgen
    rustup-unstable
  ];
}
