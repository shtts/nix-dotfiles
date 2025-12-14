{ pkgs, lib, ... }:
{
  programs.kitty = {
    enable = true;
    themeFile = "Nord";

    font = {
      name =  "JetBrainsMono Nerd Font";
      size = 12;
    };


keybindings = {
    "ctrl+shift+l" = "next_tab";
    "ctrl+shift+h"  = "previous_tab";
    "ctrl+shift+t"     = "new_tab";
    "ctrl+shift+q"     = "close_tab";
    
  };
    settings = {
      background_opacity = lib.mkForce "0.9";
      window_padding_width = 10;
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };

  };
}
