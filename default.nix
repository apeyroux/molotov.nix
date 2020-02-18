with import <nixpkgs> {};

let

  version = "4.2.2";

  molotov-app = fetchurl {
    url = "http://desktop-auto-upgrade.molotov.tv/linux/${version}/molotov.AppImage";
    sha256 = "00p8srf4yswbihlsi3s7kfkav02h902yvrq99wys11is63n01x8z";
    executable = true;
  };

  molotov-bin = writeScriptBin "molotov" ''
    #!${pkgs.stdenv.shell}
    ${appimage-run}/bin/appimage-run ${molotov-app}
  '';

in molotov-bin
