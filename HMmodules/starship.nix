{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    settings = {

      format = "$directory$git_branch$git_status$nodejs$rust$golang$php$character";
      add_newline = false;

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[xg](bold red)";
      };

      git_branch = {
        format = "[$symbol$branch]($style) ";
        symbol = " ";
        style = "bold purple";
      };

      git_status = {
        format = "(($style))";
        style = "bold red";

        conflicted = " ";
        up_to_date = "";
        untracked = " ";
        modified = " ";
        staged = " ";
        deleted = " ";
        renamed = " ";
      };

      nodejs = {
        symbol = " ";
        style = "bold green";
      };
      rust = {
        symbol = " ";
        style = "bold red";
      };

      package.disabled = true;
    };
  };
}
