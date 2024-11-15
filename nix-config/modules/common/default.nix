{ self, pkgs, ... }: {

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Nixpkgs
  nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./settings/cachix.nix
    ./settings/direnv.nix
    ./settings/environment.nix
    ./settings/fonts.nix
    ./settings/gc.nix
    ./settings/gnupg.nix
    ./settings/pkgs.nix
    ./settings/vim.nix
    ./settings/zsh.nix
  ];
}
