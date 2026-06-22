{ lib, runCommandLocal, fetchFromGitHub }:

let
  template = fetchFromGitHub {
    owner = "AstroNvim";
    repo = "template";
    rev = "49a7161b776f8bc6c23508819ea1ad4e7b359bee";
    hash = "sha256-zrwpZ6Ow5qL9dml5gJFmLEOlQa02qm/AdFYGlfpw8fY=";
  };
in
runCommandLocal "nvim-config" {} ''
  cp -r ${template} $out
  chmod -R +w $out

  cat > $out/lua/community.lua << 'EOF'
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.git" },
}
EOF

  sed -i 's|install = { colorscheme = { "astrotheme", "habamax" } },|install = { colorscheme = { "catppuccin", "astrotheme" } },|' $out/lua/lazy_setup.lua
''
