with import <nixpkgs> {};

let
cramfsprogs = stdenv.mkDerivation {
  name = "cramfsprogs-1.1-6";
  src = fetchurl {
    url = http://deb.debian.org/debian/pool/main/c/cramfs/cramfs_1.1.orig.tar.gz;
    sha256 = "0s13sabykbkbp0pcw8clxddwzxckyq7ywm2ial343ip7qjiaqg0k";
  };

  buildInputs = [zlib];

  installPhase = ''
    mkdir -p $out/bin
    mv cramfsck mkcramfs $out/bin
  '';
};

cramfsswap = stdenv.mkDerivation {
  name = "cramfsswap-1.4.1";
  src = fetchurl {
    url = mirror://debian/pool/main/c/cramfsswap/cramfsswap_1.4.1.tar.gz;
    sha256 = "0c6lbx1inkbcvvhh3y6fvfaq3w7d1zv7psgpjs5f3zjk1jysi9qd";
  };

  buildInputs = [zlib];

  installPhase = ''
    mkdir -p $out/bin
    mv cramfsswap $out/bin
  '';
};
in
stdenv.mkDerivation {
  name = "bin-analysis";

  buildInputs = [
    # binary reverse engineering
    python36Packages.binwalk
    cramfsswap
    cramfsprogs
    # utilities
    tree
    wget
    unzip
  ];
}

