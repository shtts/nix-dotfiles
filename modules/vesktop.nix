{ config, pkgs, ... }:
{
  programs.vesktop = {
    enable = true;
    vencord = {
      themes = {
        "nordic" = builtins.readFile (
          pkgs.fetchurl {
            url = "https://raw.githubusercontent.com/orblazer/discord-nordic/refs/heads/master/nordic.theme.css";
            sha256 = "sha256-PCRfEqaBISe1WDYwMK1q22Cpq6oHKomrQX42/2Z45UQ=";
          }
        );
      };
    };
    settings = {
      plugins = {
        MessageLogger = {
          enabled = true;
        };
        FakeNitro.enabled = true;
        CrashHandler.enable = true;
        FullSearchContext.enable = true;
        SilentTyping.enable = true;
        VoiceMessages.enable = true;
        YoutubeAdblock.enable = true;
        WhoReacted.enable = true;
	enabledThemes = [ "nordic.css" ];
      };

    };
  };
}
