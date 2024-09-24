{ config, pkgs, ... }:
{
  imports = [
    ./hyprland
    ./dunst
    ./nvim
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "savalet";
    homeDirectory = "/home/savalet";

    stateVersion = "23.11";

    packages = with pkgs; [
      zsh
      zsh-powerlevel10k
      lazygit
      vim
      wget
      ripgrep
      btop
      htop
      spotify
      discord
      kitty
      imagemagick
      xorg.xdpyinfo
      direnv
      termius
      xfce.thunar
      hyprpaper
      waybar
      playerctl
      python3
      python311Packages.pip
      xdg-desktop-portal-hyprland
      sway-contrib.grimshot
      brightnessctl
      wireguard-tools
      wofi
      bat
      wlogout
      wl-clipboard
      wl-clip-persist
      gnupg
      pinentry
      teams-for-linux
      google-chrome
      prismlauncher
      screen
      winbox
      kubectl
      yazi
      vscode
    ];
  };

  manual.manpages.enable = false;
  programs = {
    home-manager.enable = true;
  };
}
