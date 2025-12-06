{ config, nixpkgs, ... }:
{
  programs.nushell = {
    enable = true;
    shellAliases = {
      ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview \\{}' --scheme history";
      con = "nvim ~/.config/nixos/configuration.nix";
      c = "clear";
      build = "sudo nixos-rebuild switch --flake ~/dotfiles/.config/nixos#tomtom --upgrade";
      z = "eza --icons";
      fs = "fastfetch";
      m = "microfetch";
      n = "nvim";
      b = "y ~/Books/";
      tmux = "tmux -f ~/.config/tmux/tmux.conf";
      # git aliases
      g = "git";
      gs = "git status";
      ga = "git add .";
      gc = "git commit -m";
      gp = "git push";
      gpo = "git push -u origin";
      gl = "git pull";
      gco = "git checkout";
      gcb = "git checkout -b";
    };
  };
}
