{pkgs, ...}: {
  home.packages = with pkgs; [
    ifuse
    libimobiledevice
  ];
}
