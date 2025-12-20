{
  inputs,
  pkgs,
  lib,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "zoomer";
  home.homeDirectory = "/home/zoomer";

  imports = [
    inputs.zen-browser.homeModules.beta
    ./HMmodules/default.nix
  ];
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  programs.zen-browser.enable = true;

  programs.man = {
    enable = true;
    generateCaches = true;
  };

  programs.carapace = {
    enable = true;
  };

  programs.atuin = {
    enable = true;
    daemon.enable = true;
  };

  programs.noti = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
  };

  programs.spotify-player.enable = true;
  programs.zoxide = {
    enable = true;
  };
  programs.fd.enable = true;

  programs.lazygit = {
    enable = true;
  };
  programs.neovide = {
    enable = true;
  };

  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    bash
    git-doc
    ripgrep
    parted
    cool-retro-term
    imagemagick
    chafa
    obsidian
    qwen-code
    audacity
    fd
    steam-tui
    steamcmd
    quickshell
    spotify
    spicetify-cli
    psst
    bootdev-cli
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    popcorntime
    inputplumber
    # etlegacy

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "etlegacy"
      "etlegacy-assets"
      "obsidian"
    ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/zoomer/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
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
    EDITOR = "nvim";
  };
  home.shell.enableFishIntegration = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
