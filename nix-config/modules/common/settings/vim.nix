{ pkgs-unstable, ... }: {
  environment.systemPackages = with pkgs-unstable; [
    ast-grep
    lua51Packages.lua
    lua51Packages.luarocks
    neovim
    ripgrep
    tree-sitter
    cargo
    nodejs_22
    delta
    yaml-language-server
    lazygit
  ];
}
