{ config, pkgs, ... }:
let
  nord = pkgs.fetchurl {
    url = "https://codeberg.org/dnkl/foot/raw/branch/master/themes/nord";
    sha256 = "sha256-l/5+93Jx87icxFzsQ7xWg/GoWZ49hzgXZrizQOHbI+c=";
  };
in
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font =  "JetBrainsMono Nerd Font Mono:size=12";
        pad = "10x10";
        include = "${nord}";
      };
    };
  };
}
