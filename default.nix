lib: let
  inherit (lib) filterAttrs hasSuffix;
  inherit (builtins) attrNames filter pathExists concatMap readDir;
in rec {
  getDirs = root: map (dir: root + "/${dir}") (attrNames (filterAttrs (name: type: type == "directory") (readDir root)));

  getFiles = root: map (file: root + "/${file}") (attrNames (filterAttrs (name: type: type == "regular") (readDir root)));

  getNix = root: map (file: root + "/${file}") (attrNames (filterAttrs (name: type: hasSuffix ".nix" name) (readDir root)));

  getPaths = file: root: filter pathExists (map (dir: dir + "/${file}") (getDirs root));

  getModules = concatMap (getPaths "default.nix");
}
