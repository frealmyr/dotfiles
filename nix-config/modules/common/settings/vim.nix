{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    ast-grep
    lua51Packages.lua
    lua51Packages.luarocks
    neovim
    ripgrep
    tree-sitter
    cargo
    nodejs_22
  ];
}
