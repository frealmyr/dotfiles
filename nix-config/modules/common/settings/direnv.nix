{ pkgs, ... }: {
  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    loadInNixShell = true;
    silent = true;
  };
}
