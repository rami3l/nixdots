{
  pkgs,
  homeDirectory,
  ...
}: {
  home.packages = [
    pkgs.go
  ];

  programs.go = {
    env.GOPATH = "${homeDirectory}/.go";

    telemetry = {
      mode = "off";
      date = "2000-01-01";
    };
  };
}
