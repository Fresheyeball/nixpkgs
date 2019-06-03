{ mkDerivation, ansi-terminal, ansi-wl-pprint, base, binary
, bytestring, containers, directory, edit-distance, fetchgit
, file-embed, filepath, ghc-prim, haskeline, HTTP, http-client
, http-client-tls, http-types, language-glsl, logict, mtl, network
, parsec, process, raw-strings-qq, scientific, SHA, snap-core
, snap-server, stdenv, template-haskell, text, time
, unordered-containers, utf8-string, vector, zip-archive
}:
mkDerivation {
  pname = "elm";
  version = "0.19.0";
  src = fetchgit {
    url = "https://github.com/CurrySoftware/compiler";
    sha256 = "1m0ffvjjydwdmv3drqri23zh0k91c18x180j78viy1pgmp3x6kg0";
    rev = "83e7c042ab3d636f6674abddac0f18b280d4b84a";
    fetchSubmodules = true;
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    ansi-terminal ansi-wl-pprint base binary bytestring containers
    directory edit-distance file-embed filepath ghc-prim haskeline HTTP
    http-client http-client-tls http-types language-glsl logict mtl
    network parsec process raw-strings-qq scientific SHA snap-core
    snap-server template-haskell text time unordered-containers
    utf8-string vector zip-archive
  ];
  homepage = "https://elm-lang.org";
  description = "The `elm` command line interface";
  license = stdenv.lib.licenses.bsd3;
}
