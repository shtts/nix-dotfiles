{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      # 1. Layout: Keeping it clean, but adding the language symbol
      format = "$directory$git_branch$git_status$nodejs$rust$golang$php$character";
      add_newline = false;

      # 2. The Prompt: A sharp arrow looks faster than '>'
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[xg](bold red)";
        # or use "⚡" if you want to feel powerful
      };

      # 3. Directory: Add the folder icon
      directory = {
        truncation_length = 3;
        style = "bold blue";
        format = "[ $path]($style) "; #   is the folder icon
        read_only = " ";
      };

      # 4. Git Branch: The classic branch glyph
      git_branch = {
        format = "[$symbol$branch]($style) ";
        symbol = " "; # The standard git branch icon
        style = "bold purple";
      };

      # 5. Git Status: Professional geometric shapes
      git_status = {
        format = "([$all_status$ahead_behind]($style) )";
        style = "bold red";

        # The cool part: Geometric indicators
        conflicted = " "; # Warning triangle
        up_to_date = ""; # Silent if clean
        untracked = " "; # Question mark (styled)
        modified = " "; # Circle with dot
        staged = " "; # Plus in circle
        deleted = " "; # Minus in circle
        renamed = " "; # Arrow circle
      };

      # 6. Web Dev Tools (Only show these when relevant)
      # These add a nice professional touch when you enter a project
      nodejs = {
        symbol = " ";
        style = "bold green";
      };
      rust = {
        symbol = " ";
        style = "bold red";
      };

      # Disable the noisy ones
      package.disabled = true;
    };
  };
}
