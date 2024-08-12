{
  description = "Simple helper functions for my system";

  outputs = {nixpkgs, ...}: {
    lib = import ./default.nix nixpkgs.lib;
    formatter = {
      "x86_64-linux" = nixpkgs.legacyPackages."x86_64-linux".alejandra;
      "aarch64-darwin" = nixpkgs.legacyPackages."aarch64-darwin".alejandra;
    };
    overlays.default = final: prev: {lib = prev.lib // (import ./default.nix prev.lib);};
  };
}
