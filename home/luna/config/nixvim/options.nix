{
  programs.nixvim = {
    globals.mapleader = " ";

    diagnostic = {
      settings = {
        virtual_text = {
          prefix = "●";
          source = "if_many";
        };
        signs = true;
        update_in_insert = false;
        severity_sort = true;
      };
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      mouse = "a";
      hidden = true;
      termguicolors = true;
      scrolloff = 8;
      signcolumn = "yes";
      clipboard = "unnamedplus";
      splitright = true;
      splitbelow = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
    };
  };
}
