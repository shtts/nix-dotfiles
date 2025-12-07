{ pkgs, ... }:
{
  programs.obsidian = {
    enable = true;
    vaults = {
      "thoughts haven" = {
        enable = true;
        settings = {
          appearance = {
            cssTheme = "Nord";
          };
          themes = [
            {
              pkg = pkgs.fetchFromGitHub {
                owner = "insanum";
                repo = "obsidian_nord";
                rev = "master";
                hash = "sha256-LdjxEpxnsV4YXI9K72o2m6E1nhZvKb/r/WCuVKihugI=";
                name = "Nord";
              };
              enable = true;
            }
          ];

        };
      };
    };
    defaultSettings.themes = [ "gruvbox" ];

  };
}
