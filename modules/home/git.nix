{pkgs, ...}: {
  programs.git = {
    enable = true;

    userName = "awtterpip";
    userEmail = "awtterpip@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };

  home.packages = [pkgs.gh pkgs.git-lfs];
}
