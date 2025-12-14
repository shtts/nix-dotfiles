{ pkgs, ... }:
{
  programs.vesktop = {
    enable = true;

    vencord = {
      themes = {
        "nordic" = builtins.readFile (
          pkgs.fetchurl {
            url = "https://raw.githubusercontent.com/orblazer/discord-nordic/e7e73dd6ef314047d947f98a8a65ebd77101a82e/nordic.theme.css";
            sha256 = "sha256-PCRfEqaBISe1WDYwMK1q22Cpq6oHKomrQX42/2Z45UQ=";
          }
        );
      };

      settings = {
        enabledThemes = [ "nordic.css" ];

        plugins = {
          MessageLogger.enabled = true;
          FakeNitro.enabled = true;
          CrashHandler.enabled = true;
          FullSearchContext.enabled = true;
          SilentTyping.enabled = true;
          VoiceMessages.enabled = true;
          YoutubeAdblock.enabled = true;
          WhoReacted.enabled = true;
        };
      };
    };
  };
}
