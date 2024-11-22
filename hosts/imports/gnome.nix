{
  services.xserver = {
    enable = true;

    displayManager = {
      gdm = {
        enable = true;
        autoSuspend = false;
      };
    };

    desktopManager = {
      xterm.enable = false;
      gnome = {
        enable = true;
      };
    };

    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
