{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      format = "$directory$git_branch$git_status$character";
      add_newline = false;

      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[x](bold red)";
      };

      directory = {
        truncation_length = 3;
        style = "bold blue";
      };

      git_branch = {
        format = "[$symbol$branch]($style) ";
        symbol = ""; 
        style = "bold purple";
      };

      git_status = {
        format = "([$all_status$ahead_behind]($style) )";
        style = "bold red";
        conflicted = "=";
        up_to_date = "";
        untracked = "?";
        modified = "*";
        staged = "+";
        deleted = "-";
        renamed = "»";
      };

      package.disabled = true;
    };
  };
}
