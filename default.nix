lib: let
  inherit (lib) filterAttrs;
  inherit (builtins) attrNames filter pathExists concatMap readDir match;
in rec {
  getDirs = root: map (dir: root + "/${dir}") (attrNames (filterAttrs (name: type: type == "directory") (readDir root)));

  getFiles = root: map (file: root + "/${file}") (attrNames (filterAttrs (name: type: type == "regular") (readDir root)));

  getNix = root: filter (file: match ''*\.nix'' file) (getFiles root);

  getPaths = file: root: filter pathExists (map (dir: dir + "/${file}") (getDirs root));

  getModules = concatMap (getPaths "default.nix");
}
