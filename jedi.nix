{ lib, buildPythonPackage, fetchPypi, pytest, glibcLocales, tox, pytestcov, parso }:

buildPythonPackage rec {
  pname = "jedi";
  # switch back to stable version on the next release.
  # current stable is incompatible with parso
  version = "0.18.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "01q7xla9ccjra3j4nhb1lvn4kv8z8sdfqdx1h7cgx2md9d00lmcj";
  };

  checkInputs = [ pytest glibcLocales tox pytestcov ];

  propagatedBuildInputs = [ parso ];

  checkPhase = ''
    LC_ALL="en_US.UTF-8" py.test test
  '';

  # tox required for tests: https://github.com/davidhalter/jedi/issues/808
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/davidhalter/jedi";
    description = "An autocompletion tool for Python that can be used for text editors";
    license = licenses.lgpl3Plus;
    maintainers = with maintainers; [ dmvianna ];
  };
}
