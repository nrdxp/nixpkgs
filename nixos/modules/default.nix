let
  moduleList = import ./module-list.nix;
  modules = with builtins;
    let
      modules' = map
        (path:
          let
            name' = baseNameOf path;
            len = stringLength name';
            # remove file suffix
            name = substring 0 (len - 4) name';
          in
          { inherit name; value = import path; })
        moduleList;
    in
    listToAttrs modules';
in
modules // {
  notDetected = import ./installer/scan/not-detected.nix;
}
