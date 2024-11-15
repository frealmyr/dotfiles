{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    bat
    btop
    coreutils
    curl
    ed
    fd
    findutils
    fzf
    gawk
    git
    gnugrep
    gnumake
    gnused
    gnutar
    gnupg
    htop
    jq
    less
    parallel
    tmux
    tree
    vim
    wget
    xz
    yq
  ];
}
