# Anland Termux APT Repository

> ⚠️ **EXPERIMENTAL** — Patched builds, startup tested only. Use at your own risk.

## Add Repository

### Quick Install (via curl)
Run the following command to automatically add the repository and install the desired packages:
```bash
curl -sL https://enderbk.is-cool.dev/anland-repo/install.sh | bash
```

### Manual Install
```bash
echo 'deb [trusted=yes] https://enderbk.is-cool.dev/anland-repo stable main' \
  >> $PREFIX/etc/apt/sources.list.d/anland.list
pkg update
```

## Install Hyprland

```bash
pkg install hyprland
```

> ⚠️ **Note:** The package installs successfully, but launching Hyprland on a new environment has not been resolved yet. Still working on it.

## Install Plasma Mobile

```bash
pkg install plasma-mobile plasma-keyboard plasma-settings
```


## Packages

| Package | Version | Description |
|---------|---------|-------------|
| `hyprland` | 0.55.0 | Dynamic tiling Wayland compositor |
| `libaquamarine` | 0.12.1 | Hyprland rendering backend |
| `libhyprutils` | 0.13.1 | Hyprland utility library |
| `libhyprlang` | 0.6.8 | Hyprland config language |
| `libhyprcursor` | 0.1.13 | Cursor management |
| `libhyprgraphics` | 0.5.1 | Graphics library |
| `libhyprwire` | 0.3.1 | IPC socket library |
| `hyprwayland-scanner` | 0.4.6 | Wayland protocol scanner |
| `libinput` | 1.27.0 | Input device library |
| `libudev-zero` | 1.0.3 | Minimal udev |
| `libxcb-errors` | 1.0.1 | XCB error helper |
| `tomlplusplus` | 3.4.0 | TOML parser (C++17) |
| `anland` | 5.11.0 | Anland display daemon for Termux |
| `kwin-anland` | 6.7.2 | KWin compositor (Anland patched) |
| `xwayland` | 24.1.12 | XWayland compatibility layer |
| `mesa` | 26.2.0 | Mesa graphics libraries |
| `plasma-mobile` | 6.4.0-anland-5 | KDE Plasma Mobile shell |
| `plasma-nano` | 6.4.0-anland-5 | KDE Plasma Nano minimal shell (provides nanoshell module) |
| `plasma-keyboard` | 6.4.0-anland-5 | Plasma virtual keyboard |
| `plasma-settings` | 6.4.0-anland-5 | Plasma settings app |

## Repo URL

```
deb [trusted=yes] https://enderbk.is-cool.dev/anland-repo stable main
```

## Info

- Architecture: `aarch64` (Android ARM64)
- Status: **Experimental** — startup tested only
- Maintainer: [enderbk0](https://github.com/enderbk0)
- Source: [github.com/enderbk0/anland-repo](https://github.com/enderbk0/anland-repo)

## Credits

- Special thanks to [lfdevs/anland-termux](https://github.com/lfdevs/anland-termux) for the original Anland Termux display server implementation and configurations.

