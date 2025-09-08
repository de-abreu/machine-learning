{
  description = "🤖 Machine Learning development environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    # Custom Python environment
    pythonEnv = pkgs.python313.withPackages (ps:
      with ps; [
        pip
      ]);

    requirementsFile = pkgs.writeTextFile {
      name = "requirements.txt";
      text = ''
        jupyter==1.1.1
        islp==0.4.0
        ipykernel==6.30.1
      '';
    };

    runScript = pkgs.writeShellApplication {
      name = "launch-jupyter";
      runtimeInputs = with pkgs; [
        pythonEnv
        gcc # Provides libstdc++.so.6
        zlib
        stdenv.cc.cc.lib # C++ standard library
      ];
      text = ''
        python -m venv .venv
        # shellcheck disable=SC1091
        source .venv/bin/activate
        pip install -r ${requirementsFile}
        python -m ipykernel install --name "Python (ISLP)" --user 2> /dev/null
        jupyter notebook
      '';
    };
  in {
    # For `nix run`
    packages.${system}.default = runScript;
  };
}
