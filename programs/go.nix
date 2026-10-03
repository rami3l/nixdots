{
  pkgs,
  const,
  ...
}: {
  home.packages = with pkgs; [
    go

    air
    goda
  ];

  programs.go = {
    env.GOPATH = "${const.homeDirectory}/.go";

    telemetry = {
      mode = "off";
      date = "2000-01-01";
    };
  };
}
