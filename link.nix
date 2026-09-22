{
  config,
  lib,
  ...
}: let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (lib) map mergeAttrsList;

  symlinkRoot = ./link;
  link = name: mkOutOfStoreSymlink (symlinkRoot + "/${name}");

  linkFile = name: {${name}.source = link name;};
  confFiles = map linkFile [
    # "./proxychains/proxychains.conf"
  ];

  linkDir = name: {
    ${name} = {
      source = link name;
      recursive = true;
    };
  };
  confDirs = map linkDir [
    "proxychains"
  ];
in {
  xdg.configFile = mergeAttrsList (confFiles ++ confDirs);
}
