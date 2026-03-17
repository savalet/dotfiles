{ pkgs, username, osConfig, ... }:
{
  nixpkgs.config.allowUnfree = true;

  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "blue";
  };

  imports = [
    ./nvim

    ./bash
    ./btop
    ./dunst
    ./hyprland
    ./xkb
    ./zsh

    ./git.nix
    ./gtk.nix
    ./kitty.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    keyboard = null; # using custom layout

    stateVersion = "22.11";
    sessionVariables.EDITOR = "nvim";

    packages = with pkgs; [
      # settings
      arandr
      brightnessctl

      # messaging
      discord
      google-chrome
      firefox-devedition
      termius
      telegram-desktop

      # dev
      nix-output-monitor
      gnumake
      lazygit
      tokei
      wakatime-cli
      arduino-ide
      android-studio

      # misc
    ] ++ (if osConfig.services.pipewire.enable then [
      spotify
      pamixer
      pavucontrol
    ] else [ ]) ++ [
      gimp
      fastfetch
      pass

      # utils
      peek
      ripgrep
      dconf
      zip
      unzip

      wofi
      hyprpaper
      hyprlock
      waybar
      sway-contrib.grimshot

      scom
      prismlauncher
      winbox4
      python3
      networkmanagerapplet

      vlc
      obs-studio
      vscode
      jetbrains-toolbox
    ];
  };

  manual.manpages.enable = false;
  programs = {
    dircolors.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };

    feh.enable = true;
    home-manager.enable = true;
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
