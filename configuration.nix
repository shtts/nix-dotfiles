# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    inputs.noctalia.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
  ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-36.9.5"
  ];
  powerManagement.enable = true;
  programs.virt-manager.enable = true;

  programs.mango.enable = true;

  programs.niri.enable = true;

  services.noctalia-shell.enable = true;

  nix.optimise.automatic = true;

  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      nord
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };

    users.zoomer = {
      imports = [ ./home.nix ];
    };
  };

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
  programs.neovim.enable = true;

  xdg.mime = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "thunar.desktop" ];
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];
      "application/x-pdf" = [ "org.pwmt.zathura.desktop" ];
      "application/epub+zip" = [ "org.pwmt.zathura.desktop" ];
    };
  };
  users.groups.libvirtd.members = [ "zoomer" ];

  virtualisation.libvirtd.enable = true;

  xdg.portal.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.docker = {
    enable = true;
  };

  boot = {
    loader.systemd-boot.enable = false;
    loader.grub.enable = true;
    loader.grub.device = "nodev";
    loader.grub.useOSProber = true;
    loader.grub.efiSupport = true;
    loader.efi.canTouchEfiVariables = true;
    loader.efi.efiSysMountPoint = "/boot";
  };

  programs.command-not-found.enable = false;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  networking = {
    hostName = "tomtom";
    networkmanager.wifi.macAddress = "random";
    networkmanager.enable = true;
  };
  services = {
    udisks2.enable = true;
    gvfs.enable = true;
    power-profiles-daemon.enable = true;
    tumbler.enable = true;
    gnome.gnome-keyring.enable = true;
    atuin.enable = true;
    blueman.enable = true;
    keyd.enable = true;
    upower.enable = true;
  };

  # miniflux rss reader config
  services.miniflux = {
    enable = true;
    package = pkgs.miniflux;
    adminCredentialsFile = "/home/zoomer/.config/nixos/miniflux-admin";
  };
  # self-hosted things
  # services.freshrss = {
  #   enable = true;
  #   defaultUser = "zoomer";
  #   authType = "form";
  #   passwordFile = "/run/secrets/freshrss";
  #   baseUrl = "http://freshrss";
  # };

  services.flood.package = true;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # Set your time zone.
  time.timeZone = "Africa/Casablanca";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_MA.UTF-8";
    LC_IDENTIFICATION = "ar_MA.UTF-8";
    LC_MEASUREMENT = "ar_MA.UTF-8";
    LC_MONETARY = "ar_MA.UTF-8";
    LC_NAME = "ar_MA.UTF-8";
    LC_NUMERIC = "ar_MA.UTF-8";
    LC_PAPER = "ar_MA.UTF-8";
    LC_TELEPHONE = "ar_MA.UTF-8";
    LC_TIME = "ar_MA.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.ly.enable = true;
  # services.displayManager.cosmic-greeter.enable = true;
  # services.desktopManager.cosmic.enable = true;
  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  #   # Configure keymap in X11
  # };

  # fonts
  fonts = {
    packages = [ pkgs.nerd-fonts.jetbrains-mono ];
    enableDefaultPackages = true;
  };
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  services.pipewire.pulse.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  zramSwap.enable = true;

  environment.shellAliases = {
    "ls" = "ls";
  };
  programs.fish = {
    enable = true;
    shellAliases = {
      ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview \\{}' --scheme history";
      con = "hx ~/.config/nixos/configuration.nix";
      c = "clear";
      todo = "nvim $(find ~/Documents/todo_lists/ -type f | fzf)";
      build = "sudo nixos-rebuild switch --flake ~/dotfiles/.config/nixos#tomtom --upgrade";
      z = "eza --icons";
      fs = "fastfetch";
      m = "microfetch";
      n = "nvim";
      b = "y ~/Books/";
      tmux = "tmux -f ~/.config/tmux/tmux.conf";
    };
  };
  nixpkgs.config = {
    packageOverrides = pkgs: {
      helium = pkgs.callPackage /home/zoomer/programming/nix/helium.nix { };
      stable = import <nixos-25.05> {
        # pass the nixpkgs config to the unstable alias # to ensure `allowUnfree = true;` is propagated:
        config = config.nixpkgs.config;
      };
    };
  };

  users.users.zoomer = {
    shell = pkgs.nushell;
    isNormalUser = true;
    description = "zoomer";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      wget
      iw
      pv
      wirelesstools
      aircrack-ng
      nodejs_22
      zathura
      gnome-epub-thumbnailer
      evil-helix
      gnumake
      libtool
      pandoc
      cmake
      zellij
      tealdeer
      home-manager
      prettierd
      obsidian
      miniflux
      grim
      wev
      slurp
      flameshot
      waybar
      rofi
      openmoji-color
      base16-schemes
      mangayomi
      planify
      mpris-timer
      kooha
      collision
      nixfmt-rfc-style
      cron
      mat2
      eza
      font-manager
      groff
      killall
      motrix
      hakuneko
      upscayl
      qview
      prismlauncher
      wallabag
      heroic
      lutris
      faugus-launcher
      nix-ld
      steam-run
      everest-mons
      nix-init
      jdk
      python313Packages.pip
      cmatrix
      clock-rs
      rustup
      rustc
      cargo
      btop
      cava
      unrar
      smassh
      hyprpicker
      appimage-run
      cbonsai
      qbittorrent
      mpv
      kew
      amberol
      gapless
      ffmpeg_7
      mediainfo
      imagemagick
      ghostscript
      gimp
      wf-recorder
      spotube
      feishin
      legcord
      fluffychat
      arrpc
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      kdePackages.kdenlive
      feh
      wine
      p7zip
      mangohud
      antimicrox
      fzf
      xwayland-satellite
      timewarrior
      bitwarden-desktop
      speedtest
      dino
      git
      stow
      nixfmt
      gcc
      fastfetch
      duf
      microfetch
      unzip
      swww
      brightnessctl
      wl-clipboard
      pavucontrol
      pulseaudio
      easyeffects
      nwg-look
      papirus-icon-theme
      rose-pine-cursor
      nordzy-cursor-theme
      gnome-themes-extra
      adwaita-qt
      adwaita-qt6
      findutils
      zsh
      fish
      nushell
      coreutils
      tree
      yt-dlp
      kdePackages.ark
      xarchiver
      nautilus
      file-roller
      davinci-resolve
      ncdu
      rdfind
      kdePackages.qtsvg
      niriswitcher
      rapidraw
      ripgrep
      ripgrep-all
    ];
  };

  programs.kdeconnect.enable = true;
  # gaming

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
      vpl-gpu-rt
      intel-vaapi-driver
      intel-media-driver
    ];
  };
  hardware.bluetooth.enable = true;

  programs.steam.enable = true;

  programs.steam.gamescopeSession.enable = true;

  programs.gamemode.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.05";
}
