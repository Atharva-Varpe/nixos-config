{ lib, stdenvNoCC, fetchurl, autoPatchelfHook }:

stdenvNoCC.mkDerivation rec {
  pname = "antigravity-cli";
  version = "1.0.8";

  src = fetchurl {
    url = "https://storage.googleapis.com/antigravity-public/antigravity-cli/${version}-5963827121094656/linux-x64/cli_linux_x64.tar.gz";
    hash = "sha256-24yp08jM4GUecrb/+oN04nmcVVTZTfKx+eQrtRV0W/8=";
  };

  sourceRoot = ".";

  nativeBuildInputs = [ autoPatchelfHook ];

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D antigravity $out/bin/agy
    runHook postInstall
  '';

  meta = with lib; {
    description = "Google Antigravity CLI - terminal AI coding agent (agy)";
    homepage = "https://antigravity.google/cli";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
  };
}
