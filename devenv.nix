{pkgs, ...}: {
  packages = with pkgs; [
    dbeaver-bin
    sqlite
    zlib
  ];

  languages.python = {
    enable = true;
    venv = {
      enable = true;
      requirements = ./requirements.txt;
    };
  };
}
