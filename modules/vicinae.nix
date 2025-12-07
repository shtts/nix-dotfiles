{
  pkgs,
  lib,
  ...
}:
{
  programs.vicinae = {
    enable = true;
  };

  systemd.user.services.vicinae = {
    Unit = {
      Description = "Vicinae Server";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.vicinae}/bin/vicinae server --replace";
      Restart = "always";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
  home.activation = {
    restartVicinae = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD systemctl --user restart vicinae.service
    '';
  };
}
