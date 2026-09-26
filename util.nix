{
  lib,
  const,
  ...
}: {
  _module.args.util = {
    isSystem = sys: lib.hasSuffix "-${sys}" const.system;
  };
}
