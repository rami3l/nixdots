{
  config,
  lib,
  homeDirectory,
  ...
}: let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (lib) map mergeAttrsList;

  # NOTE: This is explicitly set to the absolute path of the base directory in
  # its string form; using paths will result in links to generated sources in
  # the Nix store, which will make the feedback loop much slower and prone to
  # GC-caused breakage.
  symlinkRoot = "${homeDirectory}/.config/nixdots/link";
  link = name: mkOutOfStoreSymlink "${symlinkRoot}/${name}";

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
    "bat"
    "proxychains"
    "zellij"
  ];
in {
  xdg.configFile = mergeAttrsList (confFiles ++ confDirs);
}
