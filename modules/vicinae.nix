{
  pkgs,
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
}
