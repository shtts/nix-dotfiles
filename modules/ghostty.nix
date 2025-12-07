{ config, pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    systemd.enable = true;
    settings = {
      theme = "Nord";
    };
  };
}
