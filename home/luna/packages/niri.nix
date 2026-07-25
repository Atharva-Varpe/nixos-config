{ ... }:

{
  programs.niri.config = ''
    prefer-no-csd true

    hotkey-overlay {
        skip-at-startup true
    }

    cursor {
        theme "breeze_cursors"
        size 24
    }

    xwayland-satellite {
        enable false
    }

    window-rule {
        opacity 0.9
        background-effect {
            xray true
            blur true
            noise 0.05
            saturation 1.0
        }
    }

    window-rule {
        match app-id="^org\\.quickshell$"
        open-floating true
    }
  '';
}
