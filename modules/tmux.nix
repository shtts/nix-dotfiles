{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    escapeTime = 0;
    mouse = true;
    baseIndex = 1;
    historyLimit = 100000;
    disableConfirmationPrompt = true;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    plugins = with pkgs; [
      tmuxPlugins.nord
      tmuxPlugins.resurrect
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '10' # Save every 10 minutes
          set -g allow-passthrough on
          set -ga update-environment TERM
          set -ga update-environment TERM_PROGRAM
          set -g visual-activity off
        '';
      }
    ];
  };
}
