{
  programs.nixvim = {
    opts.guifont = "JetBrainsMono Nerd Font:h12";

    globals = {
      neovide_opacity = 0.9;
      neovide_hide_mouse_when_typing = true;
      neovide_cursor_animation_length = 0.05;
      neovide_cursor_trail_size = 0.8;
      neovide_floating_blur_amount_x = 2.0;
      neovide_floating_blur_amount_y = 2.0;
    };
  };
}
