with builtins;
let
  toCamelCase = string:
    let
      toUpper = string:
        let
          lowerChars = [ "a" "b" "c" "d" "e" "f" "g" "h" "i" "j " "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" ];
          upperChars = [ "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" ];
        in
        replaceStrings lowerChars upperChars string;
      words = filter (word: isString word) (split "-|_" string);
      camels = concatMap
        (word: [ (toUpper (head word)) ] ++ (tail word))
        (map (string: match "(^.)(.*)" string) (tail words));
    in
    concatStringsSep "" ([ (head words) ] ++ camels);
  moduleList = import ./module-list.nix;
  modules =
    let
      modules' = map
        (path:
          let
            name' = baseNameOf path;
            len = stringLength name';
            # remove file suffix
            name = toCamelCase (substring 0 (len - 4) name');
          in
          { inherit name; value = import path; })
        moduleList;
    in
    listToAttrs modules';
in
modules //
  # modules that shouldn't be included as part of the base system go here
{
  notDetected = import ./installer/scan/not-detected.nix;
}
