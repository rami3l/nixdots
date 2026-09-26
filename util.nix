{
  lib,
  username,
  system,
  homeDirectory,
  ...
}: {
  _module.args.util = {
    inherit username system homeDirectory;

    isSystem = sys: lib.hasSuffix "-${sys}" system;
  };
}
