{
  programs.nixvim.plugins = {
      # LSP servers
      lsp = {
        enable = true;

        servers = {
          # Nix
          nixd.enable = true;

          # Rust
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };

          # TypeScript / JavaScript
          ts_ls.enable = true;

          # Python
          pylsp = {
            enable = true;
            settings.pylsp.plugins = {
              pycodestyle.enabled = true;
              pyflakes.enabled = true;
              jedi_completion.enabled = true;
              pylint.enabled = false;
            };
          };

          # Lua
          lua_ls = {
            enable = true;
            settings.Lua = {
              runtime.version = "LuaJIT";
              diagnostics.globals = [ "vim" ];
              workspace.checkThirdParty = false;
            };
          };
        };
      };

      # Syntax highlighting
      treesitter = {
        enable = true;
        settings = {
          ensureInstalled = [
            "nix" "python" "lua"
            "javascript" "typescript" "tsx"
            "rust" "json" "yaml" "bash"
            "css" "html" "markdown" "markdown_inline"
            "toml" "vim" "gitcommit" "diff"
          ];
          autoInstall = true;
          highlight.enable = true;
          indent.enable = true;
        };
      };
    };
}
