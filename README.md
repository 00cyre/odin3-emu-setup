# 🎮 AYN Odin 3 — Emulation Setup

Complete emulation setup guide for the AYN Odin 3 handheld.

---

## 📱 Emulators

| Console | Emulator | Download |
|---|---|---|
| PS1 | DuckStation | [Play Store](https://play.google.com/store/apps/details?id=com.github.stenzek.duckstation) |
| PS2 | NetherSX2 | [APK Mirror](https://github.com/Trixarian/NetherSX2-patch) |
| Nintendo DS | DraStic | [Play Store](https://play.google.com/store/apps/details?id=com.dsemu.drastic) |
| Nintendo DS (free) | melonDS | [GitHub](https://github.com/melonDS-emu/melonDS-android/releases) |
| SNES | RetroArch (Snes9x) | [Play Store](https://play.google.com/store/apps/details?id=com.retroarch) |
| GBA | MyBoy! | [Play Store](https://play.google.com/store/apps/details?id=com.fastemulator.gba) |
| N64 | Mupen64Plus FZ | [Play Store](https://play.google.com/store/apps/details?id=org.mupen64plusae.v3_fz) |
| PSP | PPSSPP | [Play Store](https://play.google.com/store/apps/details?id=org.ppsspp.ppsspp) |
| Multi-system | RetroArch | [Play Store](https://play.google.com/store/apps/details?id=com.retroarch) |

---

## 🗂️ Recommended Folder Structure

```
/storage/emulated/0/
├── Roms/
│   ├── PS1/
│   ├── PS2/
│   ├── NDS/
│   ├── SNES/
│   ├── GBA/
│   ├── N64/
│   └── PSP/
└── BIOS/
    ├── PS1/
    │   ├── scph5501.bin   ← US
    │   ├── scph5502.bin   ← EU
    │   └── scph5500.bin   ← JP
    ├── PS2/
    │   └── ps2-bios.bin
    └── NDS/
        ├── bios7.bin
        ├── bios9.bin
        └── firmware.bin
```

---

## 🗃️ BIOS Files

See [`bios/README.md`](bios/README.md) for where to place each BIOS file per emulator.

> ⚠️ BIOS files must be dumped from hardware you legally own.

---

## 🎮 Controller Fix (Game Hub / Game Native / Steam)

See [`CONTROLLER_FIX.md`](CONTROLLER_FIX.md) for full troubleshooting steps.

---

## ⚙️ Scripts

| Script | What it does |
|---|---|
| [`scripts/create_folders.sh`](scripts/create_folders.sh) | Creates the full ROM/BIOS folder structure |

---

## 📋 Quick Start

1. Install emulators from the table above
2. Run `scripts/create_folders.sh` via Termux to set up folders
3. Drop ROMs into the matching folder
4. Drop BIOS files as per `bios/README.md`
5. Point each emulator to its folder
6. Fix controller via `CONTROLLER_FIX.md` if needed
