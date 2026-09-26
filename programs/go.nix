{
  pkgs,
  util,
  ...
}: {
  home.packages = [
    pkgs.go
  ];

  programs.go = {
    env.GOPATH = "${util.homeDirectory}/.go";

    telemetry = {
      mode = "off";
      date = "2000-01-01";
    };
  };
}
