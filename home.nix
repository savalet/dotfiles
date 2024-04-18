{ config, pkgs, ... }:
{
  home = {
    username = "savalet";
    homeDirectory = "/home/savalet";

    stateVersion = "23.11";

    packages = with pkgs; [
      hello
    ];
  };

  manual.manpages.enable = false;
  programs = {
    home-manager.enable = true;
  };
}
