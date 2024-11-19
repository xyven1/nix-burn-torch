{
  description = "Burn Torch Example";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = {nixpkgs, ...}: {
    devShells.x86_64-linux.default = let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.cudaSupport = true;
      };
    in
      pkgs.mkShell {
        packages = with pkgs; [
          cargo
        ];
        # Needed for runtime
        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
          (pkgs.libtorch-bin.overrideAttrs (old: {
            version = "2.2.0";
            src = pkgs.fetchzip {
              url = "https://download.pytorch.org/libtorch/cu121/libtorch-cxx11-abi-shared-with-deps-2.2.0%2Bcu121.zip";
              sha256 = "PQ01bQe0gYYYtgxzgPbxpk0alvKK6IzDGsLtcBSu+lU=";
            };
            cudaSupport = true;
          }))
        ];
        # Version of cuda burn framework will build against
        TORCH_CUDA_VERSION = "cu121";
      };
  };
}
