{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pinentry_mac
  ];
}
