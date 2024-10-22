{ pkgs, ... }: {
  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    loadInNixShell = true;
    direnvrcExtra = ''
      echo "loaded direnv!"
    '';
    silent = true;
  };
}
