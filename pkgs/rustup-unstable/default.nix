{
  pkgs,
  rustPlatform,
  rustup-src,
  ...
}:
rustPlatform.buildRustPackage {
  pname = "rustup";
  version = "unstable";
  src = rustup-src;
  cargoLock.lockFile = "${rustup-src}/Cargo.lock";

  doCheck = false;

  buildNoDefaultFeatures = true;
  buildFeatures = [
    "no-self-update"
    "reqwest-rustls-tls"
  ];

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
}
