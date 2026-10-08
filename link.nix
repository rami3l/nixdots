{
  config,
  pkgs,
  lib,
  const,
  ...
}: let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (pkgs) stdenv;
  inherit (lib) mergeAttrsList optionals;

  # NOTE: This is explicitly set to the absolute path of the base directory in
  # its string form; using paths will result in links to generated sources in
  # the Nix store, which will make the feedback loop much slower and prone to
  # GC-caused breakage.
  symlinkRoot = "${const.homeDirectory}/.config/nixdots/link";
  link = name: mkOutOfStoreSymlink "${symlinkRoot}/${name}";

  linkFile = name: {${name}.source = link name;};
  homeCfgFiles = map linkFile [
    ".ssh/config"
    ".gitignore"
    ".haskeline"
    ".proxychains/proxychains.conf"
  ];
  xdgCfgFiles = map linkFile (
    [
      "fish/_config.fish"
      "fish/conf.d/nix.fish"
      "fish/functions/fish_hybrid_key_bindings.fish"
      "fish/functions/yy.fish"
      "jj/config.toml"
      "starship.toml"
    ]
    ++ optionals stdenv.hostPlatform.isDarwin [
      "Brewfile"
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
      "ghostty"
      "git"
      "jjui"
      "zellij"
    ]
    ++ optionals stdenv.hostPlatform.isDarwin [
      "paneru"
    ]
  );
in {
  home.file = mergeAttrsList (homeCfgFiles ++ homeCfgDirs);
  xdg.configFile = mergeAttrsList (xdgCfgFiles ++ xdgCfgDirs);
}
