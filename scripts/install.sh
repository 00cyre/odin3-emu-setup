#!/bin/bash
# ============================================================
#  AYN Odin 3 — Emulation Auto-Installer
#  Run this in Termux: bash install.sh
# ============================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

BASE="/storage/emulated/0"
ROMS="$BASE/Roms"
BIOS="$BASE/BIOS"
DOWNLOADS="$BASE/Download/emu-setup"

echo ""
echo -e "${CYAN}${BOLD}╔══════════════════════════════════════╗${NC}"
echo -e "${CYAN}${BOLD}║   AYN Odin 3 — Emulation Installer  ║${NC}"
echo -e "${CYAN}${BOLD}╚══════════════════════════════════════╝${NC}"
echo ""

# ── Check Termux storage access ──────────────────────────────
if [ ! -d "$BASE" ]; then
  echo -e "${RED}[!] No storage access.${NC}"
  echo -e "${YELLOW}    Run: termux-setup-storage${NC}"
  echo -e "${YELLOW}    Then re-run this script.${NC}"
  exit 1
fi
echo -e "${GREEN}[✓] Storage access OK${NC}"

# ── Update packages & install tools ──────────────────────────
echo ""
echo -e "${BOLD}[1/4] Installing required tools...${NC}"
pkg update -y -q
pkg install -y wget unzip curl 2>/dev/null
echo -e "${GREEN}[✓] Tools ready${NC}"

# ── Create folder structure ───────────────────────────────────
echo ""
echo -e "${BOLD}[2/4] Creating folder structure...${NC}"

SYSTEMS=("PS1" "PS2" "NDS" "SNES" "GBA" "GBC" "NES" "N64" "PSP" "Genesis" "Arcade")
for sys in "${SYSTEMS[@]}"; do
  mkdir -p "$ROMS/$sys"
  echo -e "  ${GREEN}✓${NC} Roms/$sys"
done

mkdir -p "$BIOS/PS1"
mkdir -p "$BIOS/PS2"
mkdir -p "$BIOS/NDS"
mkdir -p "$BIOS/GBA"
mkdir -p "$DOWNLOADS"

echo -e "${GREEN}[✓] Folders created${NC}"

# ── Download BIOS files ───────────────────────────────────────
echo ""
echo -e "${BOLD}[3/4] Downloading BIOS files...${NC}"
echo -e "${YELLOW}      (This may take a few minutes)${NC}"
echo ""

download_and_extract() {
  local name="$1"
  local url="$2"
  local dest="$3"
  local file="$DOWNLOADS/${name}.zip"

  echo -ne "  Downloading ${name}... "
  if wget -q --show-progress -O "$file" "$url" 2>&1; then
    echo -ne "  Extracting... "
    unzip -o -q "$file" -d "$dest" && echo -e "${GREEN}✓${NC}" || echo -e "${RED}✗ extract failed${NC}"
  else
    echo -e "${RED}✗ download failed${NC}"
    echo -e "  ${YELLOW}↳ Manual link: see bios/README.md in the repo${NC}"
  fi
}

# PS1 BIOS
download_and_extract \
  "PS1_BIOS" \
  "http://www.mediafire.com/download/s11dvh2snfrmy29/PS1_BIOS.zip" \
  "$BIOS/PS1"

# PS2 BIOS (catbox backup — faster than archive.org)
download_and_extract \
  "PS2_BIOS" \
  "https://files.catbox.moe/7kfx59.zip" \
  "$BIOS/PS2"

# NDS BIOS — note: mega links can't be wget'd directly
# Using the Dropbox backup instead
echo -e "  ${YELLOW}⚠ NDS BIOS: Mega links can't be auto-downloaded.${NC}"
echo -e "  ${YELLOW}  Download manually: https://mega.nz/#!KPwUHYCZ!mCzMRg3UN8UGJ2WKxAbCMaWVLUdAX0KCYHb0egCbrUk${NC}"
echo -e "  ${YELLOW}  Then move bios7.bin, bios9.bin, firmware.bin to: $BIOS/NDS/${NC}"

# GBA BIOS
download_and_extract \
  "GBA_BIOS" \
  "http://www.mediafire.com/download/uijj3i3349h8j2j/gba_bios.zip" \
  "$BIOS/GBA"

# RetroArch BIOS pack (large ~500MB — optional)
echo ""
echo -ne "  ${BOLD}Download RetroArch all-in-one BIOS pack? (~500MB) [y/N]:${NC} "
read -r RETRO_PACK
if [[ "$RETRO_PACK" =~ ^[Yy]$ ]]; then
  mkdir -p "$BASE/RetroArch/system"
  download_and_extract \
    "RetroArch_BIOS_Pack" \
    "https://github.com/Abdess/retrobios/releases/download/v2026.03.17/Lakka_RetroArch_BIOS_Pack.zip" \
    "$BASE/RetroArch/system"
fi

# ── APK links ─────────────────────────────────────────────────
echo ""
echo -e "${BOLD}[4/4] Emulator install links${NC}"
echo -e "${YELLOW}      (Open these in your browser to install)${NC}"
echo ""

echo -e "  ${CYAN}PS1    →${NC} DuckStation (Play Store)"
echo -e "         ${BOLD}https://play.google.com/store/apps/details?id=com.github.stenzek.duckstation${NC}"
echo ""
echo -e "  ${CYAN}PS2    →${NC} NetherSX2 (APK — sideload)"
echo -e "         ${BOLD}https://github.com/Trixarian/NetherSX2-patch${NC}"
echo ""
echo -e "  ${CYAN}NDS    →${NC} DraStic (Play Store, paid) or melonDS (free)"
echo -e "         ${BOLD}https://play.google.com/store/apps/details?id=com.dsemu.drastic${NC}"
echo -e "         ${BOLD}https://github.com/melonDS-emu/melonDS-android/releases${NC}"
echo ""
echo -e "  ${CYAN}SNES   →${NC} RetroArch (Play Store)"
echo -e "         ${BOLD}https://play.google.com/store/apps/details?id=com.retroarch${NC}"
echo ""
echo -e "  ${CYAN}GBA    →${NC} MyBoy! (Play Store)"
echo -e "         ${BOLD}https://play.google.com/store/apps/details?id=com.fastemulator.gba${NC}"
echo ""
echo -e "  ${CYAN}N64    →${NC} Mupen64Plus FZ (Play Store)"
echo -e "         ${BOLD}https://play.google.com/store/apps/details?id=org.mupen64plusae.v3_fz${NC}"
echo ""
echo -e "  ${CYAN}PSP    →${NC} PPSSPP (Play Store)"
echo -e "         ${BOLD}https://play.google.com/store/apps/details?id=org.ppsspp.ppsspp${NC}"
echo ""

# ── Done ──────────────────────────────────────────────────────
echo -e "${GREEN}${BOLD}╔══════════════════════════════════════╗${NC}"
echo -e "${GREEN}${BOLD}║           Setup Complete! 🎮          ║${NC}"
echo -e "${GREEN}${BOLD}╚══════════════════════════════════════╝${NC}"
echo ""
echo -e "  ROM folders:  ${BOLD}$ROMS${NC}"
echo -e "  BIOS folders: ${BOLD}$BIOS${NC}"
echo ""
echo -e "  ${YELLOW}Next steps:${NC}"
echo -e "  1. Install emulators from the links above"
echo -e "  2. Drop ROMs into the matching folder under $ROMS"
echo -e "  3. Point each emulator to its BIOS folder under $BIOS"
echo -e "  4. If controller not working → read CONTROLLER_FIX.md in the repo"
echo ""
echo -e "  ${CYAN}Repo: https://github.com/00cyre/odin3-emu-setup${NC}"
echo ""
