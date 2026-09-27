{pkgs, ...}: let
  rustup-unstable = pkgs.rustPlatform.buildRustPackage {
    pname = "rustup";
    version = "1.30.0-unstable-2026-09-25";

    src = pkgs.fetchFromGitHub {
      owner = "rust-lang";
      repo = "rustup";
      rev = "b32adec5ab613c26d7f35e398c8a54f4a46f585b";
      hash = "sha256-ryy1AxwBtVslRJbDzEMLo4wuYBzxFxMx0Z2Yoem75g8=";
    };

    cargoHash = "sha256-JMlzghf7WPfbSuv6S6k3Qpb46g2JJadMp+OgPumcxPs=";

    buildNoDefaultFeatures = true;
    buildFeatures = [
      "no-self-update"
      "reqwest-rustls-tls"
    ];
    doCheck = false;

    nativeBuildInputs = [pkgs.pkg-config];

    postInstall = ''
      pushd $out/bin
      mv rustup-init rustup
      binlinks=(
        cargo cargo-clippy cargo-fmt cargo-miri clippy-driver rls
        rust-analyzer rust-gdb rust-gdbgui rust-lldb rustc rustdoc rustfmt
      )
      for link in ''${binlinks[@]}; do
        ln -s rustup $link
      done
      popd
    '';
  };
in {
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
    rustup-unstable
  ];
}
