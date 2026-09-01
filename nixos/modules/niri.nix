{ config, pkgs, ... }: {
  programs.niri = {
    enable = true;
  };

  services.getty = {
    autologinUser = "hafades";
    autologinOnce = true;
  };

  environment.loginShellInit = ''
    if [[ "$(tty)" == "/dev/tty1" ]]; then
      exec ${config.programs.niri.package}/bin/niri-session
    fi
  '';

  systemd.user.services.niri.enableDefaultPath = false;
}
