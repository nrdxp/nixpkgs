{ lib
, buildPythonPackage
, fetchFromGitHub
}:

buildPythonPackage rec {
  pname = "hexbytes";
  version = "0.2.2";

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-SZscM6ze9yY+iRDx/5F4XbrLXIbp6QkFnzxN7zvP9CQ=";
  };

  # propagatedBuildInputs = [
  #   eth-utils
  #   hexbytes
  # ];

  # # The test needs MuJoCo that is not free library.
  # doCheck = false;

  # pythonImportsCheck = [ "gym" ];

  meta = with lib; {
    description = "Python `bytes` subclass that decodes hex, with a readable console output";
    homepage = "https://github.com/ethereum/hexbytes";
    license = licenses.mit;
    maintainers = with maintainers; [ nrdxp ];
  };
}
