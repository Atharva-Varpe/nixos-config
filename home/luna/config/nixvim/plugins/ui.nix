{
  programs.nixvim = {
    extraConfigLua = ''
      -- Source DMS-generated theme if available
      local ok, _ = pcall(function()
        vim.cmd([[luafile ~/.config/DankMaterialShell/dank-neovim.lua]])
      end)
      if not ok then
        vim.cmd.colorscheme("catppuccin")
      end

      -- LSP keybindings via LspAttach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        end,
      })

      -- Diagnostic signs
      local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋼 " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    '';

    plugins = {
      # File explorer
      neo-tree = {
        enable = true;
        settings = {
          close_if_last_window = true;
          sources = [ "filesystem" "buffers" "git_status" ];
          window = {
            position = "left";
            width = 30;
            mappings = {
              "<space>" = false;
            };
          };
          filesystem = {
            follow_current_file = { enabled = true; };
            hijack_netrw_behavior = "open_default";
            filtered_items = {
              hide_dotfiles = false;
              hide_gitignored = false;
              visible = false;
            };
          };
          default_component_configs = {
            indent = { indent_size = 2; padding = 1; };
            icon = {
              folder_closed = "▶";
              folder_open = "▼";
            };
            modified = { symbol = "[+] "; highlight = "NeoTreeModified"; };
            git_status = {
              symbols = {
                added = "✚";
                deleted = "✖";
                modified = "";
                renamed = "➜";
                untracked = "★";
                ignored = "◌";
                unstaged = "✗";
                staged = "✓";
                conflict = "";
              };
            };
          };
        };
      };

      # Tab line / buffer bar
      bufferline = {
        enable = true;
        settings.options = {
          diagnostics = "nvim_lsp";
          always_show_bufferline = false;
          show_buffer_close_icons = true;
          show_close_icon = true;
          color_icons = true;
          separator_style = "thin";
        };
      };

      # Dashboard
      alpha = {
        enable = true;
        theme = "dashboard";
      };

      # Statusline
      lualine = {
        enable = true;
        settings = {
          options = {
            theme = "catppuccin";
            component_separators = { left = ""; right = ""; };
            section_separators = { left = ""; right = ""; };
            globalstatus = true;
          };
          sections = {
            lualine_a = [ "mode" ];
            lualine_b = [ "branch" "diff" "diagnostics" ];
            lualine_c = [ "filename" ];
            lualine_x = [ "encoding" "fileformat" "filetype" ];
            lualine_y = [ "progress" ];
            lualine_z = [ "location" ];
          };
        };
      };

      # Keybinding popup
      which-key = {
        enable = true;
        settings = {
          win = {
            border = "rounded";
            padding = [ 1 2 ];
            title = true;
            title_pos = "center";
          };
          layout = {
            width = { min = 20; max = 50; };
            spacing = 3;
          };
          show_keys = true;
          show_help = true;
          plugins = {
            spelling = { enabled = true; suggestions = 20; };
            presets = {
              operators = true;
              motions = true;
              text_objects = true;
              windows = true;
              nav = true;
              z = true;
              g = true;
            };
          };
        };
      };

      # Git decorations
      gitsigns = {
        enable = true;
        settings = {
          signs = {
            add = { text = "┃"; };
            change = { text = "┃"; };
            delete = { text = "▁"; };
            topdelete = { text = "▔"; };
            changedelete = { text = "~"; };
          };
          signcolumn = true;
          numhl = false;
          linehl = false;
          attach_to_untracked = true;
          current_line_blame = false;
          max_file_length = 40000;
          update_debounce = 100;
          sign_priority = 6;
          preview_config = { border = "rounded"; };
        };
      };

      web-devicons.enable = true;
    };
  };
}
