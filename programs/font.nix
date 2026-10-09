{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  nixpkgs.config.input-fonts.acceptLicense = true;

  home.packages = with pkgs; [
    # Mono
    agave
    cascadia-code
    fantasque-sans-mono
    fira-code
    fragment-mono
    ia-writer-mono
    iosevka-bin
    jetbrains-mono
    league-mono
    maple-mono.opentype
    monaspace
    paper-mono
    sudo-font

    ## Nerd fonts
    nerd-fonts._0xproto
    nerd-fonts.d2coding
    nerd-fonts.inconsolata
    nerd-fonts.mononoki
    nerd-fonts.roboto-mono
    nerd-fonts.symbols-only

    ## JP composites
    hackgen-nf-font
    moralerspace-hw
    plemoljp-nf
    udev-gothic-nf

    ## Google fonts
    (google-fonts.override {fonts = ["MPLUSCodeLatin" "OxygenMono"];})

    # Text
    barlow
    cormorant
    dejavu_fonts
    eb-garamond
    ibm-plex
    inter
    merriweather
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    recursive
    roboto
    roboto-flex
    roboto-slab
    source-code-pro

    # Mono/Text
    input-fonts
    noto-fonts
  ];
}
