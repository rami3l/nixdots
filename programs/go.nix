{
  pkgs,
  const,
  ...
}: {
  home.packages = [
    pkgs.go
  ];

  programs.go = {
    env.GOPATH = "${const.homeDirectory}/.go";

    telemetry = {
      mode = "off";
      date = "2000-01-01";
    };
  };
}
