{
  pkgs,
  lib,
  rustPlatform,
  pacaptr-src,
}:
rustPlatform.buildRustPackage {
  pname = "pacaptr";
  version = "unstable";
  src = pacaptr-src;
  cargoLock.lockFile = "${pacaptr-src}/Cargo.lock";

  doCheck = false;

  nativeBuildInputs = [pkgs.pkg-config];
  buildInputs = [pkgs.libgit2];

  meta = {
    description = "Pacman-like syntax wrapper for many package managers";
    homepage = "https://github.com/rami3l/pacaptr";
    license = lib.licenses.gpl3Only;
    mainProgram = "pacaptr";
    platforms = lib.platforms.unix;
  };
}
