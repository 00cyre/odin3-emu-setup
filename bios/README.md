# 🗃️ BIOS Files — Placement Guide

> ⚠️ BIOS files must be legally obtained by dumping from hardware you own.

---

## PS1 — DuckStation

**BIOS folder:** `DuckStation/bios/` (internal storage)

Or configure it in: DuckStation → Settings → BIOS → BIOS Directory

| File | Region |
|---|---|
| `scph5500.bin` | Japan |
| `scph5501.bin` | USA ✅ (most common) |
| `scph5502.bin` | Europe |

---

## PS2 — AetherSX2 / NetherSX2

**BIOS folder:** Configure in app → Settings → BIOS Directory

Files needed (varies by PS2 model):
- `ps2-0230e-20160727.bin` (or similar — full BIOS dump from your PS2)

Multiple BIOS files are fine; the emulator will let you pick.

---

## Nintendo DS — melonDS

**BIOS folder:** melonDS → Settings → DS-mode → DS BIOS/firmware paths

| File | Description |
|---|---|
| `bios7.bin` | ARM7 BIOS |
| `bios9.bin` | ARM9 BIOS |
| `firmware.bin` | DS Firmware |

> DraStic doesn't require BIOS files but runs better with them (same files).

---

## RetroArch

**BIOS folder:** `RetroArch/system/` on internal storage

Place the relevant BIOS files there. RetroArch uses them automatically per core.

Common files:
- `scph5501.bin` — PS1 (Beetle PSX core)
- `bios7.bin`, `bios9.bin`, `firmware.bin` — NDS (melonDS core)

---

## No BIOS needed ✅

- SNES (Snes9x)
- GBA (most games — optional for some)
- N64 (Mupen64Plus)
- PSP (PPSSPP)
