{ pkgs, ... }:
{
  home.packages = with pkgs; [ dunst ];

  home.file.dunst= {
    source = ./dunstrc;
    target = ".config/dunst/dunstrc";
  };
}
