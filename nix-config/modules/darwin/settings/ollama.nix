{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    ollama
  ];

  launchd = {
    user = {
      agents = {
        ollama-serve = {
          environment = {
            OLLAMA_ORIGINS = "app://obsidian.md*";
          };
          command = "${pkgs.ollama}/bin/ollama serve";
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
