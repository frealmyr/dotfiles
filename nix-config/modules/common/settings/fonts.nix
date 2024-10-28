{ pkgs, ... }: {
  fonts = {
    packages = [
      (pkgs.nerdfonts.override {
        fonts = [
          "FiraMono"
          "FiraCode"
        ];
      })
    ];
  };
}
