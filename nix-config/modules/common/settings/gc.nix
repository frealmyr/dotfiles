{ lib, ... }: {
  nix.gc = {
    automatic = true;
    interval = lib.lists.genList (day: {
      Hour = 8;
      Minute = 30;
      Day = day + 1;
    }) 7;
    options = "--delete-older-than 14d";
  };

  nix.optimise = {
    automatic = true;
    interval = lib.lists.genList (day: {
      Hour = 8;
      Minute = 45;
      Day = day + 1;
    }) 7;
  };
}
