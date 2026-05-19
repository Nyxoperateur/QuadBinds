# QuadBinds

Free Windows application to make Quad Binds configuration easier in **Fortnite** and remap other keys as well. The [Interception](https://github.com/oblitum/Interception) driver allows bypassing the keyboard → mouse remap that no longer works correctly due to a recent **Fortnite** update.

## Folder Contents

| File | Description |
|---------|-------------|
| `QuadBinds.exe` | Application (portable, no installation needed) |
| `Install-Interception.bat` | Installs the Interception driver (once per PC) |
| `Install-Interception.ps1` | Script used by the `.bat` (do not run alone unless needed) |

## Requirements

- **Windows 10/11** (64-bit)
- **Administrator rights** for QuadBinds (low-level keyboard hook)
- **Interception driver** installed + **PC restart** after first installation

## Quick Setup

### 1. Interception Driver (once only)

1. Double-click **`Install-Interception.bat`**
2. Accept the UAC elevation prompt if Windows asks
3. Wait for the download and installation to complete
4. **Restart your PC** (mandatory)

### 2. Launch QuadBinds

1. Double-click **`QuadBinds.exe`**
2. Accept the UAC elevation prompt on first launch (required for remapping)
3. Configure your binds in the interface — everything is **saved automatically**

## Usage

- **Quad Binds**: 3 keys → right click / left click / right click (default `1`, `2`, `3`)
- **Quintuple Binds**: second set of keys (e.g. numpad)
- **Other remaps**: one key to another (e.g. `²` → `F5`)
- **Settings**: "Fortnite only" option, pause/quit shortcuts, FR/EN language

Default shortcuts (editable):

| Key | Action |
|-----|--------|
| F7 | Enable / pause remapping |
| F8 | Stop the engine |

Configuration is saved at:

`%APPDATA%\QuadBinds\config.json`

## Credits

- [Interception](https://github.com/oblitum/Interception) by oblitum (keyboard/mouse driver)
- [interception-python](https://github.com/kennyhml/pyinterception)

## License

See the project's main repository for the license.
