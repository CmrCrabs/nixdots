{ pkgs, config, ...}:
let
  email = "zayaanazam1234@hotmail.com";
  name = "CmrCrabs";
in
{
  programs.git = {
    enable = true;
    userEmail = email;
    userName = name;
    extraConfig = {
      color.ui = "true";
      core.editor = "nvim";
      init.defaultBranch = "main";
    };
  };
}
