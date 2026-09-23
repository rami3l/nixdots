{
  config,
  lib,
  homeDirectory,
  system,
  ...
}: let
  inherit (builtins) match;
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (lib) map mergeAttrsList optionals;

  isSystem = sys: match ".*-${sys}" system != null;

  # NOTE: This is explicitly set to the absolute path of the base directory in
  # its string form; using paths will result in links to generated sources in
  # the Nix store, which will make the feedback loop much slower and prone to
  # GC-caused breakage.
  symlinkRoot = "${homeDirectory}/.config/nixdots/link";
  link = name: mkOutOfStoreSymlink "${symlinkRoot}/${name}";

  linkFile = name: {${name}.source = link name;};
  homeCfgFiles = map linkFile [
    ".proxychains/proxychains.conf"
  ];
  xdgCfgFiles = map linkFile (
    optionals (isSystem "darwin") [
      "karabiner/karabiner.json"
    ]
  );

  linkDir = name: {
    ${name} = {
      source = link name;
      recursive = true;
    };
  };
  homeCfgDirs = map linkDir [];
  xdgCfgDirs = map linkDir (
    [
      "bat"
      "fastfetch"
      "jjui"
      "zellij"
    ]
    ++ optionals (isSystem "darwin") [
      "paneru"
    ]
  );
in {
  home.file = mergeAttrsList (homeCfgFiles ++ homeCfgDirs);
  xdg.configFile = mergeAttrsList (xdgCfgFiles ++ xdgCfgDirs);
}
