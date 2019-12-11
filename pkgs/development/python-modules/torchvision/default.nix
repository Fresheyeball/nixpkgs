{ buildPythonPackage
, fetchPypi
, six
, numpy
, pillow
, pytorch
, lib
, fetchFromGitHub
, which
, cudatoolkit
, linuxPackages
, cmake
, utillinux
, ninja
}:

buildPythonPackage rec {
  version = "0.4.2";
  pname   = "torchvision";

  src = fetchFromGitHub {
    owner  = "pytorch";
    repo   = "vision";
    rev    = "v${version}";
    fetchSubmodules = true;
    sha256 = "0xzn9qm55z8gjs5r1irxyfh5402hczzc34fyfhlzpzkhd59fcz7m";
  };

  nativeBuildInputs = [
    cmake
    utillinux
    which
    cudatoolkit
    linuxPackages.nvidia_x11
    ninja
    pytorch
  ];

  dontUseCmakeConfigure = true;
  doCheck = false;

  buildInputs = [ pytorch ];

  FORCE_CUDA="1";

  propagatedBuildInputs = [ six numpy pillow pytorch ];

  meta = {
    description = "PyTorch vision library";
    homepage    = https://pytorch.org/;
    license     = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ericsagnes ];
  };
}
