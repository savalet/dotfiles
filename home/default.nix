{ config, pkgs, ... }:
{
  imports = [
    ./hyprland
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
      neovim
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
      dunst
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
    ];
  };

  manual.manpages.enable = false;
  programs = {
    home-manager.enable = true;
  };
}
