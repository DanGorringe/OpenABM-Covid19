with import <nixpkgs> { };
python3Packages.buildPythonPackage {
  name = "OpenABM-Covid19";
  src = ./OpenABM-Covid19;
  patches = [ ./python3.7.patch ];

  hardeningDisable = [ "fortify" ];
  buildPhase = ''make all'';
  installPhase = ''make PIP_FLAGS=--prefix="$out" install'';
  doCheck = false;

  nativeBuildInputs = [ gsl swig which python3 ];
  buildInputs = with python3Packages; [ pip setuptools wheel ];
  propagatedBuildInputs = with python3Packages; [
    click matplotlib pandas tqdm
  ];
}
