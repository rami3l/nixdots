{
  lib,
  fetchurl,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "pacaptr";
  version = "0.23.2";

  src = fetchurl {
    url = "https://github.com/rami3l/pacaptr/archive/refs/tags/v${version}.tar.gz";
    sha256 = "1bea159c9c4cab7af842797e2950192cfb1db43fefcf5897be0717bff01dd995";
  };
  sourceRoot = "${pname}-${version}";

  cargoLock.lockFile = fetchurl {
    url = "https://raw.githubusercontent.com/rami3l/pacaptr/v${version}/Cargo.lock";
    sha256 = "9b8a6085965428b1c27f20e57d0b2c0f7be3ca1dede45ab3940138dfd409f42b";
  };

  doCheck = false;

  meta = {
    description = "Pacman-like syntax wrapper for many package managers";
    homepage = "https://github.com/rami3l/pacaptr";
    license = lib.licenses.gpl3Only;
    mainProgram = "pacaptr";
    platforms = lib.platforms.unix;
  };
}
