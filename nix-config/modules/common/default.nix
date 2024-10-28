{ self, pkgs, ... }: {

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Nixpkgs
  nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./settings/direnv.nix
    ./settings/environment.nix
    ./settings/fonts.nix
    ./settings/gnupg.nix
    ./settings/pkgs.nix
    ./settings/vim.nix
    ./settings/zsh.nix
  ];
}
