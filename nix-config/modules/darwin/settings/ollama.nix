{ pkgs-unstable, ... }: {
  environment.systemPackages = with pkgs-unstable; [
    ollama
  ];

  homebrew = {
    casks = [
      "ollamac"
    ];
  };

  launchd = {
    user = {
      agents = {
        ollama-serve = {
          environment = {
            OLLAMA_ORIGINS = "app://obsidian.md*";
          };
          command = "${pkgs-unstable.ollama}/bin/ollama serve";
          serviceConfig = {
            KeepAlive = true;
            RunAtLoad = true;
            StandardOutPath = "/tmp/ollama.out.log";
            StandardErrorPath = "/tmp/ollama.err.log";
          };
        };
      };
    };
  };
}
