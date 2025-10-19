{
  inputs = {
    utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    utils,
  }:
    utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (
            with pkgs; [
              libxkbcommon
              vulkan-loader
              glfw-wayland
              glfw
              glew
              mesa
              libGL
              libGLU
            ]
          );
          buildInputs = with pkgs; [
            jdk
            glfw-wayland
            glfw
            glew
            mesa
            libGL
            libGLU
          ];
        };
      }
    );
}
