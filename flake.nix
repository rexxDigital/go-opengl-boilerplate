{
  description = "Flake for go-opengl-boilerplate";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells.${system}.default =
      pkgs.mkShell
        {
          buildInputs = [
            pkgs.gnumake
            pkgs.pkg-config
            pkgs.libGL
            pkgs.xorg.libX11
            pkgs.xorg.libXinerama
            pkgs.xorg.libXcursor
            pkgs.xorg.libXrandr
            pkgs.xorg.libXi
            pkgs.xorg.libXxf86vm
          ];

          shellHook = ''
            echo "Make build to build, make run to run"
          '';
        };
  };
}
