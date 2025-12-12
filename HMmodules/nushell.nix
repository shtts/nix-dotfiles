{ config, nixpkgs, ... }:
{
  programs.nushell = {
    enable = true;

    environmentVariables = {
      MANPAGER = "nvim +Man!";
      XDG_CURRENT_DESKTOP = "wlroots";
      XDG_SESSION_TYPE = "wayland";
      GDK_BACKEND = "wayland";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
      OZONE_PLATFORM = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "Wayland;xcb";
    };

    extraConfig = ''
      $env.config.edit_mode = "vi" ;
    '';

    shellAliases = {
      c = "clear";
      fs = "fastfetch";
      m = "microfetch";
      n = "nvim";
      b = "y ~/Books/";
      cd = "z";

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
