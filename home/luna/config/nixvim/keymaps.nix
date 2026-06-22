{
  programs.nixvim.keymaps = [
    # General
    {
      mode = "n";
      key = "<leader>w";
      action = "<cmd>w<CR>";
      options = { desc = "Save file"; };
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>q<CR>";
      options = { desc = "Quit"; };
    }
    {
      mode = "n";
      key = "<leader>c";
      action = "<cmd>bdelete<CR>";
      options = { desc = "Close buffer"; };
    }

    # Explorer
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<CR>";
      options = { desc = "Toggle file explorer"; silent = true; };
    }

    # Buffer navigation
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options = { desc = "Previous buffer"; };
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<CR>";
      options = { desc = "Next buffer"; };
    }

    # Telescope
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
      options = { desc = "Find files"; };
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<CR>";
      options = { desc = "Live grep"; };
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<CR>";
      options = { desc = "Find buffers"; };
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<CR>";
      options = { desc = "Help tags"; };
    }
    {
      mode = "n";
      key = "<leader>sk";
      action = "<cmd>Telescope keymaps<CR>";
      options = { desc = "Search keymaps (cheatsheet)"; };
    }

    # Window navigation
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = { desc = "Move to left window"; };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = { desc = "Move to window below"; };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = { desc = "Move to window above"; };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = { desc = "Move to right window"; };
    }

    # Split management
    {
      mode = "n";
      key = "<leader>sv";
      action = "<cmd>vsplit<CR>";
      options = { desc = "Vertical split"; };
    }
    {
      mode = "n";
      key = "<leader>sh";
      action = "<cmd>split<CR>";
      options = { desc = "Horizontal split"; };
    }
    {
      mode = "n";
      key = "<leader>sx";
      action = "<cmd>close<CR>";
      options = { desc = "Close current window"; };
    }
    {
      mode = "n";
      key = "<leader>so";
      action = "<cmd>only<CR>";
      options = { desc = "Close other windows (maximize)"; };
    }
    {
      mode = "n";
      key = "<leader>s=";
      action = "<C-w>=";
      options = { desc = "Equalize window sizes"; };
    }
    {
      mode = "n";
      key = "<leader>s<Up>";
      action = "<C-w>+";
      options = { desc = "Increase window height"; };
    }
    {
      mode = "n";
      key = "<leader>s<Down>";
      action = "<C-w>-";
      options = { desc = "Decrease window height"; };
    }
    {
      mode = "n";
      key = "<leader>s<Left>";
      action = "<C-w><";
      options = { desc = "Decrease window width"; };
    }
    {
      mode = "n";
      key = "<leader>s<Right>";
      action = "<C-w>>";
      options = { desc = "Increase window width"; };
    }
  ];
}
