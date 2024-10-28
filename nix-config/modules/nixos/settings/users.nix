{ pkgs, ... }: {
  users = {
    defaultUserShell = pkgs.zsh;

    users.fredrick = {
      isNormalUser = true;
      description = "Fredrick Myrvoll";
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };
}
