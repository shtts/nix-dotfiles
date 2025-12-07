{ config, pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    systemd.enable = pkgs.stdenv.isLinux;
    settings = {
      theme = "nord";
    };
  };
}
