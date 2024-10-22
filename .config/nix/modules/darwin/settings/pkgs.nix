{ pkgs, ... }: {
  nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    bat
    coreutils
    curl
    ed
    findutils
    fzf
    gawk
    git
    gnugrep
    gnumake
    gnused
    gnutar
    htop
    jq
    less
    neovim
    parallel
    pinentry_mac
    tmux
    tree
    vim
    wget
    xz
    yq
  ];
}
