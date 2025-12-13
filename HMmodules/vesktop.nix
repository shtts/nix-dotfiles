{ pkgs, ... }:
{
  programs.vesktop = {
    enable = true;

    vencord = {
      themes = {
        "nordic" = builtins.readFile (
          pkgs.fetchurl {
            url = "https://raw.githubusercontent.com/orblazer/discord-nordic/refs/heads/master/nordic.theme.css";
            sha256 = "sha256-KExcIUWLit9MQC2KBYioP6EPXW+2ivnjuhZcNfmzd4s=";
          }
        );
      };

      settings = {
        enabledThemes = [ "nordic.css" ];

        plugins = {
          MessageLogger.enabled = true;
          FakeNitro.enabled = true;
          CrashHandler.enable = true;
          FullSearchContext.enable = true;
          SilentTyping.enable = true;
          VoiceMessages.enable = true;
          YoutubeAdblock.enable = true;
          WhoReacted.enable = true;
        };
      };
    };
  };
}
