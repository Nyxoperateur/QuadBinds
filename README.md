# ⚠️ ATTENTION : NE PAS TÉLÉCHARGER VIA LE BOUTON VERT "DOWNLOAD ZIP" ⚠️

Le bouton ZIP de GitHub casse l'application.  
Pour télécharger l'application fonctionnelle, cliquez sur **Releases** à droite de l'écran ou utilisez la commande `git clone`.

# QuadBinds

Free Windows application to simplify **Quad Binds** setup in **Fortnite** and remap other keys or mouse buttons. The [Interception](https://github.com/oblitum/Interception) driver restores reliable keyboard → mouse remapping after recent **Fortnite** updates broke standard methods.

## Folder Contents

| File | Description |
|------|-------------|
| `QuadBinds.exe` | Application (portable, no installer) |
| `Install-Interception.bat` | Installs the Interception driver (once per PC) |
| `Install-Interception.ps1` | Used by the `.bat` (do not run alone unless needed) |

## Requirements

- **Windows 10/11** (64-bit)
- **Interception driver** installed + **PC restart** after first install
- **No administrator rights required** for normal use (driver-level input, similar to reWASD)

## Quick Setup

### 1. Interception driver (one time)

1. Double-click **`Install-Interception.bat`**
2. Accept UAC if Windows asks (only for driver install)
3. Wait for download and installation to finish
4. **Restart your PC** (required)

### 2. Run QuadBinds

1. Double-click **`QuadBinds.exe`** (no need to “Run as administrator”)
2. The engine starts automatically — configure binds in the UI
3. All changes are **saved automatically** (no Save button)

Optional: enable **Launch on Windows startup** in Settings (standard Startup shortcut, no UAC on every boot).

## Usage

- **Quad Binds**: 3 keys → right / left / right click (default `1`, `2`, `3`)
- **Quintuple Binds**: optional second key set (e.g. numpad)
- **Other remaps**: keyboard **or mouse** → keyboard **or mouse**  
  Supported mouse inputs: left, right, middle, side buttons 4/5, wheel up/down
- **Settings**: Fortnite-only mode, pause/stop hotkeys, language (FR/EN), autostart, start minimized

**Capture a bind**: click a slot, press a key or click a mouse button. **Escape** clears the slot.

Default hotkeys (editable in Settings):

| Key | Action |
|-----|--------|
| F7 | Enable / pause remapping |
| F8 | Stop the engine |

Config file: `%APPDATA%\QuadBinds\config.json`

## Troubleshooting

| Issue | What to do |
|-------|------------|
| Remap does nothing | Install Interception, reboot, click **Start** if the engine is stopped |
| Driver error | Run `Install-Interception.bat` again, then reboot |
| Fortnite-only enabled | Remap only works when Fortnite is in the foreground |

## Credits

- [Interception](https://github.com/oblitum/Interception) by oblitum
- [interception-python](https://github.com/kennyhml/pyinterception)

## License

See the main project repository for the license.
