{ config, nixpkgs, ... }:
{
  programs.nushell = {
    enable = true;
    shellAliases = {
      c = "clear";
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

      # nix specific aliases
      con = "nvim ~/.config/nixos/configuration.nix";
      build = "sudo nixos-rebuild switch --flake ~/dotfiles/.config/nixos#tomtom --upgrade";
      hm = "cd ~/.config/home-manager";
      hms = "home-manager switch -b backup --show-trace";
      upd = "nix flake update";
    };
  };
}
