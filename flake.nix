{
  description = "Simple helper functions for my system";

  outputs = {...}: {
    overlays.default = final: prev: {lib = prev.lib // (import ./default.nix prev.lib);};
  };
}
