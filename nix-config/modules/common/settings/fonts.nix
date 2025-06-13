{ pkgs, ... }: {
  fonts = {
    packages = [
      pkgs.nerd-fonts.fira-mono
      pkgs.nerd-fonts.fira-code
    ];
  };
}
