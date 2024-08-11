lib: let
  inherit (lib) filterAttrs;
  inherit (builtins) attrNames filter pathExists concatMap readDir;
in rec {
  getPaths = file: root:
    filter pathExists (
      map (dir: root + "/${dir}/${file}") (
        attrNames (filterAttrs (name: type: type == "directory") (readDir root))
      )
    );
  getModules = concatMap (getPaths "default.nix");
}


