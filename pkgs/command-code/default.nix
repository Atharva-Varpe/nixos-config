{ lib, buildNpmPackage, fetchurl, nodejs, makeWrapper, jq }:

buildNpmPackage rec {
  pname = "command-code";
  version = "0.37.2";

  src = fetchurl {
    url = "https://registry.npmjs.org/command-code/-/command-code-${version}.tgz";
    hash = "sha256-FZkzqdCaX48qWjodYW5KPhVVM+hueZQ4qPTI/l3e+iw=";
  };

  npmDepsHash = "sha256-uxByE4W1W9Ua9cG2PrzjClrR7KKuYGUtpxKX5nSm+qE=";

  sourceRoot = "package";

  nativeBuildInputs = [ jq makeWrapper ];

  dontNpmBuild = true;

  postPatch = ''
    cp ${./package-lock.json} package-lock.json
    ${lib.getExe jq} 'del(.devDependencies)' package.json > package.json.tmp
    mv package.json.tmp package.json
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/node_modules/command-code
    cp -r . $out/lib/node_modules/command-code/

    makeWrapper ${lib.getExe nodejs} $out/bin/command-code \
      --add-flags "$out/lib/node_modules/command-code/dist/index.mjs"

    for name in cmd cmdc commandcode; do
      ln -s $out/bin/command-code $out/bin/$name
    done

    runHook postInstall
  '';

  meta = {
    description = "Command Code, coding agent that continuously learns your coding taste";
    homepage = "https://commandcode.ai";
    license = lib.licenses.unfree;
    platforms = lib.platforms.linux;
  };
}
