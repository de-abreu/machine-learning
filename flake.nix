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
        ipykernel==6.30.1
        islp==0.4.0
        jupyter==1.1.1
        python-lsp-server[all]==1.13.1
        scikit-learn=1.7.2
      '';
    };
  in {
    # For `nix develop`
    devShells.${system}.default = pkgs.mkShell {
      packages = [pythonEnv];
      env = {
        LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
      };
      shellHook = ''
        python -m venv .venv
        # shellcheck disable=SC1091
        source .venv/bin/activate
        pip install -r ${requirementsFile}
        python -m ipykernel install --name "python_ISLP" --user
        jupyter notebook
      '';
    };
  };
}
