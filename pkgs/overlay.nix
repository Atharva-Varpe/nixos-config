{ zen-browser, system }:
self: super: {
  antigravity-cli = self.callPackage ./antigravity-cli { };
  command-code = self.callPackage ./command-code { };
  nvim-config = self.callPackage ./nvim-config { };
  zen-browser = zen-browser.packages.${system}.zen-browser;
  zen-browser-unwrapped = zen-browser.packages.${system}.zen-browser-unwrapped;
}
