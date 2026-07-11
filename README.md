# Anland Termux APT Repository

> ⚠️ **EXPERIMENTAL** — Patched builds, startup tested only. Use at your own risk.

## Add Repository

```bash
echo 'deb [trusted=yes] https://raw.githubusercontent.com/enderbk0/anland-repo/main stable main' \
  >> $PREFIX/etc/apt/sources.list.d/anland.list
pkg update
```

## Install

```bash
pkg install hyprland
pkg install plasma-mobile plasma-keyboard plasma-settings
```

## Packages

| Package | Version | Description |
|---------|---------|-------------|
| hyprland | 0.55.0 | Dynamic tiling Wayland compositor |
| libaquamarine | 0.12.1 | Hyprland rendering backend |
| libhyprutils | 0.13.1 | Hyprland utility library |
| libhyprlang | 0.6.8 | Hyprland config language |
| libhyprcursor | 0.1.13 | Cursor management |
| libhyprgraphics | 0.5.1 | Graphics library |
| libhyprwire | 0.3.1 | IPC socket library |
| hyprwayland-scanner | 0.4.6 | Wayland protocol scanner |
| libinput | 1.27.0 | Input device library |
| libudev-zero | 1.0.3 | Minimal udev |
| libxcb-errors | 1.0.1 | XCB error helper |
| tomlplusplus | 3.4.0 | TOML parser |
| plasma-mobile | 6.4.0 | KDE Plasma Mobile shell |
| plasma-keyboard | 6.4.0 | Plasma virtual keyboard |
| plasma-settings | 6.4.0 | Plasma settings app |

Architecture: `aarch64` | Status: Experimental | Maintainer: enderbk0
