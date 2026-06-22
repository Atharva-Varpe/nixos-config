# BUG: Niri session not starting from GDM

## Symptom
GDM shows the login screen, you enter your password, session tries to start, then immediately crashes back to GDM.

## Root Error
```
gdm-wayland-session[2209]: Unable to run session
gdm[1839]: Gdm: GdmDisplay: Session never registered, failing
```

## Diagnostics (June 17 2026)

### 1. Missing session desktop file
The niri `.desktop` file is **not present** in the wayland-sessions directory:
```
$ ls /run/current-system/sw/share/wayland-sessions/niri.desktop
No such file or directory
```
GDM reads session files from this directory to populate the gear-icon menu and to know how to launch them. Without the file, GDM can't start the session, even if niri and niri-session binaries exist.

### 2. niri package and binaries exist
- `niri` binary: present at `/run/current-system/sw/bin/niri`
- `niri-session` wrapper: present at `/run/current-system/sw/bin/niri-session`
- niri systemd user unit: present at `/run/current-system/etc/systemd/user/niri.service`
- `programs.niri.enable = true` **is** set in the NixOS config
- `security.polkit.enable = true` **is** set
- `programs.niri.package` resolves to `niri-26.04`

### 3. NixOS module sets session correctly
The nixpkgs niri module uses `services.xserver.displayManager.session = [...]` to register the session. However, this seems to depend on `services.xserver.enable = true`, which may not be fully functional when the X server is disabled but GDM (Wayland-only) is used.

### 4. NVIDIA GPU initialization failure (may be secondary)
```
NVRM: GPU 0000:01:00.0: RmInitAdapter failed! (0x24:0x72:1743)
[drm:nv_drm_dev_load [nvidia_drm]] *ERROR* [nvidia-drm] Failed to allocate NvKmsKapiDevice
```
The NVIDIA kernel module fails to initialize the GPU device. Since the laptop uses Intel integrated graphics for display (Optimus/Prime offload), the NVIDIA failure shouldn't prevent a Wayland compositor from running on the Intel GPU (i915), which loaded successfully:
```
i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
```

### 5. GDM is running GNOME Shell for the greeter
GDM successfully runs GNOME Shell on the Intel GPU for its greeter session:
```
GNOME Shell (using mutter 50.1) as a Wayland display server
Added device '/dev/dri/card1' (i915) using atomic mode setting.
```

### 6. systemd user manager starts but session dies immediately
```
pam_unix(gdm-password:session): session opened for user luna(uid=1000)
gdm-wayland-session[2209]: Unable to run session
pam_unix(gdm-password:session): session closed for user luna
```
The entire session lifecycle is ~1 second before closing.

## Hypothesis

The NixOS niri module registers the session via `services.xserver.displayManager.session`, but when only GDM is enabled (without `services.xserver.enable` or with X server disabled), the session `.desktop` file may not be symlinked into `/run/current-system/sw/share/wayland-sessions/`, so GDM never finds it. The "Unable to run session" error from `gdm-wayland-session` is GDM trying to launch a session it can't locate.

## Possible fixes to investigate

1. **Manually add session to wayland-sessions**: Use `environment.etc` or a direct symlink to place niri.desktop into the wayland-sessions directory.
2. **Ensure services.xserver.enable is true**: The displayManager session registration may depend on xserver being enabled.
3. **Use services.displayManager.sessionPackages instead**: Set `services.displayManager.sessionPackages = [ pkgs.niri ];` to let GDM discover the session directly from the package.
4. **NVIDIA fix**: The NVIDIA RmInitAdapter failure may also need addressing, but likely isn't the primary blocker since the Intel GPU works fine.
