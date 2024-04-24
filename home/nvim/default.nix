{ pkgs, ... }:
{
  home.packages = with pkgs; [ neovim ];

  home.file.nvim= {
    source = ./src;
    target = ".config/nvim";
    recursive = true;
  };
}
