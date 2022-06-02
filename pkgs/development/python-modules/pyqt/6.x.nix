{ lib
, buildPythonPackage
, isPy27
, fetchPypi
, pkg-config
, dbus
, lndir
, dbus-python
, sip
, pyqt6_sip
, pyqt-builder
, qt6Packages
, symlinkJoin
, withConnectivity ? false
, withMultimedia ? false
, withWebSockets ? false
, withLocation ? false
}:
let
  # FIXME: qmake isn't built with the proper flags to point it at the various outputs qtbase produces;
  # hack around this by joining the outputs together, and making actual copies, since qmake apparently
  # doesn't like symlinks
  qtbase' = with qt6Packages.qtbase;
    (symlinkJoin {
      inherit name;
      paths = [out dev];
    })
    .overrideAttrs (o: {
      buildCommand = builtins.concatStringsSep "\n" [
        o.buildCommand
        ''
         ( TMPLINKS=$(mktemp -u)
            trap "rm -rf $TMPLINKS" EXIT

            mv $out $TMPLINKS

            cp --reflink=auto -rL $TMPLINKS $out
         )
        ''
      ];
    });
in buildPythonPackage rec {
  pname = "PyQt6";
  version = "6.3.0";
  format = "pyproject";

  disabled = isPy27;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-T9hdyxXqTnNLbk4hb+mmJGd5dh7a8s98DM4aIwOo0xs=";
  };

  outputs = [ "out" "dev" ];

  dontWrapQtApps = true;

  nativeBuildInputs = with qt6Packages; [
    pkg-config
    lndir
    sip
    qtbase'
    qtsvg
    qtdeclarative
    qtwebchannel
  ]
    ++ lib.optional withConnectivity qtconnectivity
    ++ lib.optional withMultimedia qtmultimedia
    ++ lib.optional withWebSockets qtwebsockets
    ++ lib.optional withLocation qtpositioning;

  buildInputs = with qt6Packages; [
    dbus
    qtbase'
    qtsvg
    qtdeclarative
    pyqt-builder
  ]
    ++ lib.optional withConnectivity qtconnectivity
    ++ lib.optional withWebSockets qtwebsockets
    ++ lib.optional withLocation qtpositioning;

  propagatedBuildInputs = [
    dbus-python
    pyqt6_sip
  ];

  patches = [
  ];

  passthru = {
    inherit sip pyqt6_sip;
    multimediaEnabled = withMultimedia;
    WebSocketsEnabled = withWebSockets;
  };

  dontConfigure = true;

  # Checked using pythonImportsCheck
  doCheck = false;

  pythonImportsCheck = [
    "PyQt6"
    "PyQt6.QtCore"
    "PyQt6.QtQml"
    "PyQt6.QtWidgets"
    "PyQt6.QtGui"
  ]
    ++ lib.optional withWebSockets "PyQt6.QtWebSockets"
    ++ lib.optional withMultimedia "PyQt6.QtMultimedia"
    ++ lib.optional withConnectivity "PyQt6.QtConnectivity"
    ++ lib.optional withLocation "PyQt6.QtPositioning";

  meta = with lib; {
    description = "Python bindings for Qt6";
    homepage    = "https://riverbankcomputing.com/";
    license     = licenses.gpl3Only;
    platforms   = platforms.mesaPlatforms;
    maintainers = with maintainers; [ nrdxp ];
  };
}
