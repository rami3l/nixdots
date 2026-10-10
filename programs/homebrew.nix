{pkgs, ...}: {
  homebrew = {
    enable = pkgs.stdenv.hostPlatform.isDarwin;

    taps = [
      {
        name = "brewforge/chinese";
        repo = "https://github.com/brewforge/homebrew-chinese";
        trusted = true;
      }
      {
        name = "iohannrabeson/tap";
        repo = "https://github.com/IohannRabeson/homebrew-tap";
        trusted = true;
      }
      {
        name = "rami3l/tap";
        repo = "https://github.com/rami3l/homebrew-tap";
        trusted = true;
      }
      {
        name = "syhily/git-gc";
        repo = "https://github.com/syhily/homebrew-git-gc";
        trusted = true;
      }
      {
        name = "thedavidweng/unsigned-tap";
        repo = "https://github.com/thedavidweng/homebrew-unsigned-tap";
        trusted = true;
      }
    ];

    formulae = [
      "cargo-instruments"
      "git"
      "zstd"
      "mingw-w64"
      "paneru"
      "proxychains-ng"
      "iohannrabeson/tap/tmignore-rs"
      {
        name = "rami3l/tap/clavy";
        args = ["HEAD"];
      }
      {
        name = "rami3l/tap/pacaptr";
        args = ["HEAD"];
      }
    ];

    casks = [
      "android-platform-tools"
      "betterdisplay"
      "bettertouchtool"
      "brewforge/chinese/clashx-meta"
      "cyberduck"
      "dockey"
      "element"
      "ghostty"
      "gpg-suite"
      "iina"
      "karabiner-elements"
      "keka"
      "kodi"
      "mos"
      "motrix"
      "mountain-duck"
      "mounty"
      "netnewswire"
      "obsidian"
      "onyx"
      "openmtp"
      "pearcleaner"
      "pika"
      "podman-desktop"
      "thedavidweng/unsigned-tap/qbittorrent"
      "rapidapi"
      "sdformatter"
      "stats"
      "steam"
      "swiftdefaultappsprefpane"
      "telegram"
      "utm"
      "vesktop"
      "whisky"
      "thedavidweng/unsigned-tap/xld"
      "zotero"
    ];

    mas = [
      {
        name = "Accelerate";
        id = 1459809092;
      }
      {
        name = "Affinity Designer 2";
        id = 1616831348;
      }
      {
        name = "Affinity Photo 2";
        id = 1616822987;
      }
      {
        name = "Amphetamine";
        id = 937984704;
      }
      {
        name = "Bitwarden";
        id = 1352778147;
      }
      {
        name = "CrystalFetch";
        id = 6454431289;
      }
      {
        name = "DaisyDisk";
        id = 411643860;
      }
      {
        name = "Goodnotes";
        id = 1444383602;
      }
      {
        name = "Mactracker";
        id = 430255202;
      }
      {
        name = "Microsoft Excel";
        id = 462058435;
      }
      {
        name = "Microsoft PowerPoint";
        id = 462062816;
      }
      {
        name = "Microsoft Word";
        id = 462054704;
      }
      {
        name = "PiPifier";
        id = 1160374471;
      }
      {
        name = "Refined GitHub";
        id = 1519867270;
      }
      {
        name = "Select Like A Boss For Safari";
        id = 1437310115;
      }
      {
        name = "Tampermonkey";
        id = 6738342400;
      }
      {
        name = "TestFlight";
        id = 899247664;
      }
      {
        name = "uBlock Origin Lite";
        id = 6745342698;
      }
      {
        name = "Windows App";
        id = 1295203466;
      }
      {
        name = "Xcode";
        id = 497799835;
      }
    ];
  };
}
