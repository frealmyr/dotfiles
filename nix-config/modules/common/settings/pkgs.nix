{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    bat
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