{
  ...
}:
{
  programs.fish = {
    enable = true;
    preferAbbrs = true;
    interactiveShellInit = ''
      fish_vi_key_bindings
    '';

    shellAbbrs = {
      c = "clear";
      fs = "fastfetch";
      m = "microfetch";
      n = "nvim";
      b = "y ~/Books/";
      cd = "z";
      ne = "neovide";

      # git abbrs
      g = "git";
      gs = "git status";
      ga = "git add .";
      gc = "git commit -m";
      gp = "git push";
      gpo = "git push -u origin";
      gl = "git pull";
      gco = "git checkout";
      gcb = "git checkout -b";

      # nix specific abbrs
      con = "nvim ~/.config/nixos/configuration.nix";
      build = "sudo nixos-rebuild switch --flake ~/dotfiles/.config/nixos#tomtom --upgrade";
      hm = "cd ~/.config/home-manager";
      hms = "home-manager switch -b backup --show-trace";
      upd = "nix flake update";
    };
  };
}
