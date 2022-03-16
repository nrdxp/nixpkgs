{ lib
, buildPythonPackage
, fetchFromGitHub
, eth-utils
, hexbytes
, protobuf
, requests
, eth-account
}:

buildPythonPackage rec {
  pname = "web3.py";
  version = "ca662c8";

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = pname;
    rev = "ca662c879e95e9e184d9dfdb78855492e1d7db23";
    sha256 = "sha256-OeL4Lg1/ZCrEZQkZvCiGzcIn1X+F/BPBA4eFwF0SBoo=";
  };

  propagatedBuildInputs = [
    eth-account
    eth-utils
    hexbytes
    protobuf
    requests
  ];

  # The test needs MuJoCo that is not free library.
  doCheck = false;

  # pythonImportsCheck = [ "gym" ];

  meta = with lib; {
    description = "A python interface for interacting with the Ethereum blockchain and ecosystem.";
    homepage = "https://web3py.readthedocs.io";
    license = licenses.mit;
    maintainers = with maintainers; [ nrdxp ];
  };
}
