{ stdenv, buildPythonPackage, fetchpatch, fetchPypi
, cachetools
, flask
, freezegun
, mock
, oauth2client
, pyasn1-modules
, pytest
, pytest-localserver
, requests
, responses
, rsa
, setuptools
, six
, urllib3
}:

buildPythonPackage rec {
  pname = "google-auth";
  version = "1.16.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "2f1a6bc3031fc7cd0c1aeb225ad34febcb60268f71f5df75d5976dd20a52c002";
  };

  propagatedBuildInputs = [ six pyasn1-modules cachetools rsa setuptools ];

  checkInputs = [
    flask
    freezegun
    mock
    oauth2client
    pytest
    pytest-localserver
    requests
    responses
    urllib3
  ];

  checkPhase = ''
    py.test
  '';

  meta = with stdenv.lib; {
    description = "This library simplifies using Google’s various server-to-server authentication mechanisms to access Google APIs.";
    homepage = "https://google-auth.readthedocs.io/en/latest/";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
  };
}
