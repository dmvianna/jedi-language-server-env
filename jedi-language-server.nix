{
  lib
, buildPythonPackage
, fetchPypi
, jedi
, pygls
, pydantic
, typeguard
, docstring-to-markdown
, importlib-metadata
, pythonOlder
}:

buildPythonPackage rec {
  pname = "jedi-language-server";
  version = "0.34.1";
  disabled = pythonOlder "3.6";
  src = fetchPypi {
    inherit pname version;
    sha256 = "0b8wc9240jazffx94zhxyih292y8kb8fxmi2lvfs3snxvnzbws2k";
  };
  doCheck = true;
  propagatedBuildInputs = [ jedi pygls docstring-to-markdown pydantic typeguard ];
  meta = with lib; {
    homepage = "https://github.com/pappasam/jedi-language-server";
    description = "A Python language server exclusively for Jedi. If Jedi supports it well, this language server should too.";
    license = licenses.mit;
    maintainers = [ maintainers.dmvianna ];
  };
}
