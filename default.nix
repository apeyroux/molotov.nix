with import <nixpkgs> {};

let

  version = "4.2.2";

  molotov-app = fetchurl {
    url = "http://desktop-auto-upgrade.molotov.tv/linux/${version}/molotov.AppImage";
    sha256 = "04sb8dsk5hknkc9fqwq0r9ira2vd8z8b9skrvrlpydwm2by8gszq";
    executable = true;
  };

  molotov-bin = writeScriptBin "molotov" ''
    #!${pkgs.stdenv.shell}
    ${appimage-run}/bin/appimage-run ${molotov-app}
  '';

in molotov-bin
