{ lib
, buildPythonPackage
, isPy3k
, fetchPypi
, mock
, pytest-asyncio
, pytestCheckHook
, setuptools-scm
, pydantic
, typeguard
, pytest-trio
}:

buildPythonPackage rec {
  pname = "pygls";
  version = "0.11.1";
  disabled = !isPy3k;

  src = fetchPypi {
    inherit pname version;
    sha256 = "0683x9rrq2xzsv6sqqbsxil27rzrkp9sjrvi3g760iz1xvqwqc6b";
  };

  checkInputs = [ mock pytest-asyncio pytest-trio pytestCheckHook setuptools-scm pydantic typeguard ];

  meta = with lib; {
    description = "Pythonic generic implementation of the Language Server Protocol";
    homepage = "https://github.com/openlawlibrary/pygls";
    license = licenses.asl20;
    maintainers = with maintainers; [ kira-bruneau ];
  };
}
