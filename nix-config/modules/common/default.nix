{ ... }: {
  imports = [
    ./settings/direnv.nix
    ./settings/environment.nix
    ./settings/fonts.nix
    ./settings/gnupg.nix
    ./settings/pkgs.nix
    # ./settings/nix.nix
    ./settings/vim.nix
    ./settings/zsh.nix
  ];
}
