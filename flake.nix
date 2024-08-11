{
  description = "Simple helper functions for my system";
  
  outputs = {nixpkgs, ...}: {
    lib = import ./default.nix nixpkgs.lib;
  };
}
