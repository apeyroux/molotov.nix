with import <nixpkgs> {};

let

  version = "4.2.1";

  molotov-app = fetchurl {
    url = "http://desktop-auto-upgrade.molotov.tv/linux/${version}/molotov.AppImage";
    sha256 = "1567l987691xc77p2ixrgwl8a1ip5kffvm5rn37aj1pm4j1cdr2f";
    executable = true;
  };

  molotov-bin = writeScriptBin "molotov" ''
    #!${pkgs.stdenv.shell}
    ${appimage-run}/bin/appimage-run ${molotov-app}
  '';

in molotov-bin
