{ pkgs, ... }: {
  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    loadInNixShell = true;
    direnvrcExtra = ''
      echo "loaded direnv!"
    '';
    # silent = true; # TODO: Verify direnv is working as expected
  };
}
