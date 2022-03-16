{ lib
, buildPythonPackage
, fetchFromGitHub
, hexbytes
, eth-utils
}:

buildPythonPackage rec {
  pname = "eth-account";
  version = "0.6.1";

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-cjQvTKC4lDbKnAvbmnTGHQiJZsZFhXc/+UH5rUdlGxs=";
  };

  propagatedBuildInputs = [
    hexbytes
    eth-utils
  ];

  # # The test needs MuJoCo that is not free library.
  # doCheck = false;

  # pythonImportsCheck = [ "gym" ];

  meta = with lib; {
    description = "Account abstraction library for web3.py";
    homepage = "https://github.com/ethereum/eth-account";
    license = licenses.mit;
    maintainers = with maintainers; [ nrdxp ];
  };
}
