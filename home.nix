{
  pkgs,
  username,
  homeDirectory,
  ...
}: {
  imports = [./link.nix];

  home = {
    inherit username homeDirectory;

    stateVersion = "26.05";

    packages = with pkgs; [
      fastfetch

      # Nix development
      deadnix
      nixd
      statix
    ];
  };

  programs.home-manager.enable = true;

  programs.fastfetch.settings = {
    modules = [
      "title"
      "separator"
      {
        type = "os";
        format = "{3} {10} {12}";
      }
      "host"
      "kernel"
      "uptime"
      "packages"
      "shell"
      {
        type = "display";
        key = "Display";
        format = "{4}x{5} @ {3}Hz";
      }
      {
        type = "de";
        format = "{2} {3}";
      }
      "wm"
      "wmtheme"
      {
        type = "theme";
        format = "{?1}{1}{?3} {3}{?} [Plasma], {?}{7}";
      }
      "icons"
      "terminal"
      {
        type = "terminalfont";
        format = "{/2}{-}{/}{2}{?3} {3}{?}";
      }
      "cpu"
      {
        type = "gpu";
        key = "GPU";
      }
      {
        type = "memory";
        format = "{/1}{-}{/}{/2}{-}{/}{} / {}";
      }
      "break"
      "colors"
      "break"
    ];
  };
}
