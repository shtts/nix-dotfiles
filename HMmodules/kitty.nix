{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    themeFile = "Nord";

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };

    settings = {
      background_opacity = "0.9";
      window_padding_width = 10;
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };

  };
}
