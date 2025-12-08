{ pkgs, lib, ... }:
{
  programs.obsidian = {
    enable = true;
    vaults = {
      "thoughts haven" = {
        enable = true;
        settings = {
          corePlugins = {
            templates = true;
          };

          hotkeys = {
            "file-explorer:new-folder" = [
              {
                key = "F";
                modifiers = [
                  "Mod"
                  "Alt"
                ];
              }
            ];
            "templates:insert-template" = [
              {
                key = "T";
                modifiers = [
                  "Mod"
                  "Alt"
                ]; # Ctrl + Alt + T
              }
            ];
          };
          # appearance = {
          #   cssTheme = "Nord";
          # };
          # themes = [
          #   {
          #     pkg = pkgs.fetchFromGitHub {
          #       owner = "insanum";
          #       repo = "obsidian_nord";
          #       rev = "master";
          #       hash = "sha256-LdjxEpxnsV4YXI9K72o2m6E1nhZvKb/r/WCuVKihugI=";
          #       name = "Nord";
          #     };
          #     enable = true;
          #   }
          # ];

        };
      };
    };
    defaultSettings = {
      app = {
        vimMode = true;
      };
    };

  };
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "obsidian"
    ];
}
