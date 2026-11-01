_: {
  programs.fastfetch = {
    enable = true;

    settings = {
      modules = [
        "title"
        "separator"
        {
          type = "os";
          format = "{pretty-name}{?codename} {codename}{?}{/codename} {version}{/} {arch}";
        }
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        {
          type = "display";
          key = "Display";
          format = "{scaled-width}x{scaled-height} @ {refresh-rate}Hz";
        }
        {
          type = "de";
          format = "{pretty-name} {version}";
        }
        "wm"
        "wmtheme"
        "theme"
        "icons"
        "terminal"
        {
          type = "terminalfont";
          format = "{/name}{-}{/}{name}{?size} {size}{?}";
        }
        "cpu"
        {
          type = "gpu";
          key = "GPU";
        }
        {
          type = "memory";
          format = "{/used}{-}{/}{/total}{-}{/}{} / {}";
        }
        "break"
        "colors"
        "break"
      ];
    };
  };
}
