{ self, pkgs, ... }: {
  imports = [
    ./settings/direnv.nix
    ./settings/environment.nix
    ./settings/fonts.nix
    ./settings/gc.nix
    ./settings/gnupg.nix
    ./settings/pkgs.nix
    ./settings/vim.nix
    ./settings/zsh.nix
  ];

  # Nix settings, no touchy
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;
}
