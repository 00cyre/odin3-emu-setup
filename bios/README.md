# 🗃️ BIOS Files — Placement Guide

> Source: [Emulation General Wiki](https://emulation.gametechwiki.com/index.php/Emulator_files)

---

## ⚡ Quick Option — RetroArch All-in-One BIOS Pack

If you use RetroArch for most things, grab this one pack and it covers almost everything:

- **Download:** [Lakka RetroArch BIOS Pack](https://github.com/Abdess/retrobios/releases/download/v2026.03.17/Lakka_RetroArch_BIOS_Pack.zip)
- **Backup:** [Archive.org mirror](https://archive.org/download/retro-arch-v-1.10.1_202502/RetroArch_v1.10.1.zip)
- **Place files in:** `RetroArch/system/` on internal storage

---

## PS1 — DuckStation

**BIOS Download:**
- [PS1_BIOS.zip (MediaFire)](http://www.mediafire.com/download/s11dvh2snfrmy29/PS1_BIOS.zip)
- [Backup (Dropbox)](https://www.dropbox.com/sh/l0a18zplh1ndlo0/AAA_j4N-OO07owQB1embW_2Za?dl=0)

**Place in:** DuckStation → Settings → BIOS → BIOS Directory

| File | Region |
|---|---|
| `scph5500.bin` | Japan |
| `scph5501.bin` | USA ✅ |
| `scph5502.bin` | Europe |

---

## PS2 — AetherSX2 / NetherSX2

**BIOS Download:**
- [PS2 BIOS Megadump (Archive.org)](https://archive.org/download/ps2-bios-megadump)
- [Backup (Catbox)](https://files.catbox.moe/7kfx59.zip)

**Place in:** AetherSX2/NetherSX2 → Settings → BIOS Directory

> Required for PCSX2/AetherSX2. More info and MD5 hashes: [File Hashes - PS2](https://emulation.gametechwiki.com/index.php/File_Hashes#PlayStation_2_(PS2))

---

## Nintendo DS — melonDS / DraStic

**BIOS Download:**
- [DS BIOS files and firmware (Mega)](https://mega.nz/#!KPwUHYCZ!mCzMRg3UN8UGJ2WKxAbCMaWVLUdAX0KCYHb0egCbrUk)
- [Backup (Dropbox)](https://www.dropbox.com/sh/s6fkz3uzddrokej/AAB-wc2ylp04cJkmN62Sqq04a?dl=0)

**Place in:** melonDS → Settings → DS-mode paths

| File | Description |
|---|---|
| `bios7.bin` | ARM7 BIOS |
| `bios9.bin` | ARM9 BIOS |
| `firmware.bin` | DS Firmware |

> Optional for DeSmuME and melonDS, required for some other emulators. DraStic works without but is better with.

### DSi BIOS (for DSi-mode games)
- [DSi BIOS & NAND (USA)](https://archive.org/details/DSiFirmwareFiles)
- [Backup (Dropbox)](https://www.dropbox.com/sh/lnpuxg4u81932jr/AAAl-1PBf-mAsKlKKbsz4_gTa?dl=0)

---

## GBA — RetroArch / MyBoy

**BIOS Download:**
- [gba_bios.zip (MediaFire)](http://www.mediafire.com/download/uijj3i3349h8j2j/gba_bios.zip)
- [Backup (Dropbox)](https://www.dropbox.com/sh/75ciyaphel7c5la/AABADloONTLeLBGyhOtn6HUba?dl=0)

**File:** `gba_bios.bin`  
**Place in:** RetroArch → `system/` folder, or MyBoy → BIOS settings

> Optional for most games, required for some homebrew and GCN connectivity.

---

## Game Boy / GBC — RetroArch

**Downloads:**
- [GB (DMG) Boot ROM](https://archive.org/details/dmg_rom)
- [GBC Boot ROM (MediaFire)](http://www.mediafire.com/download/55a5ef9d248no18/gbc_bios.zip)

| File | MD5 |
|---|---|
| `dmg_boot.bin` | `32fbbd84168d3482956eb3c5051637f5` |
| `cgb_boot.bin` | `dbfce9db9deaa2567f6a84fde55f9680` |

> Mostly optional — emulators have HLE replacements. Needed for full accuracy.

---

## SNES — No BIOS needed ✅

Standard SNES games require no BIOS. Optional extras:

- [Satellaview BS-X ROMs (Mega)](https://mega.nz/#!4E0RFQhb!Lh2CzxVeYahueRk-60JfjxBnrbEUvFhGzyJnrM_pQS4) — for Satellaview releases
- [Sufami Turbo BIOS (Mega)](https://mega.nz/#!sUNzQSzB!LQ9toDbnJoVDLLCm4k8OjjmOnY-aqZbfSJ0SQ5GfOzg) — for Bandai Sufami games

---

## N64 — No BIOS needed ✅

Standard N64 games need no BIOS.

- [64DD IPL (JPN)](https://64dd.org/dumps/N64DD_IPLROM_(J).zip) — only if emulating 64DD add-on games

---

## PSP — No BIOS needed ✅

PPSSPP runs without a BIOS.

- [Original PSP Fonts (MediaFire)](http://www.mediafire.com/download/0k8654doty8wdl7/PSP+font.rar) — optional, for system font rendering

---

## Source

All links from: https://emulation.gametechwiki.com/index.php/Emulator_files
