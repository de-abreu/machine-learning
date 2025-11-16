{pkgs, ...}: {
  packages = with pkgs; [
    chromium
    dbeaver-bin
    sqlite
    zlib
  ];

  env.BROWSER = "chromium";

  languages.python = {
    enable = true;
    venv = {
      enable = true;
      requirements = ./requirements.txt;
    };
  };
}
