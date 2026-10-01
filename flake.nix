{
    description = "Nix Configs designed to run on any unix system";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        mnw.url = "github:Gerg-L/mnw";
    };

    outputs = { ... } @inputs:
    let
        lib = inputs.nixpkgs.lib;
        systems = [
            "x86_64-linux"
        ];
        forEachSystem = lib.genAttrs systems;
        newPkgs = system: import inputs.nixpkgs {
            inherit system;
            config = {
                allowUnfree = true;
                allowBroken = true;
            };
        };
        newNeovim = pkgs: inputs.mnw.lib.wrap pkgs ./neovim.nix;
    in
    {             
        # Devshell
        devShells = forEachSystem(system: let
            pkgs = newPkgs system; 
            neovim = newNeovim pkgs;
        in {
            "default" = pkgs.mkShell {
                buildInputs = [
                    neovim
                ];
                shellHook = ''

                '';
            };
        });
    };
}
