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
pkg install -y wget unzip curl termux-tools 2>/dev/null
echo -e "${GREEN}[✓] Tools ready${NC}"

# ── Create folder structure ───────────────────────────────────
echo ""
echo -e "${BOLD}[2/4] Creating folder structure...${NC}"

SYSTEMS=("PS1" "PS2" "NDS" "3DS" "SNES" "GBA" "GBC" "NES" "N64" "PSP" "Genesis" "Arcade" "Switch")
for sys in "${SYSTEMS[@]}"; do
  mkdir -p "$ROMS/$sys"
  echo -e "  ${GREEN}✓${NC} Roms/$sys"
done

mkdir -p "$BIOS/PS1"
mkdir -p "$BIOS/PS2"
mkdir -p "$BIOS/NDS"
mkdir -p "$BIOS/GBA"
mkdir -p "$BIOS/3DS"
mkdir -p "$BIOS/Switch"
mkdir -p "$DOWNLOADS"

echo -e "${GREEN}[✓] Folders created${NC}"

# ── Download BIOS files ───────────────────────────────────────
echo ""
echo -e "${BOLD}[3/4] Downloading BIOS files...${NC}"
echo -e "${YELLOW}      (This may take a few minutes)${NC}"
echo ""

download_and_extract() {
  local name="$1"
  local dest="$3"
  local file="$DOWNLOADS/${name}.zip"
  shift 3
  local urls=("$@")

  local success=false
  for url in "${urls[@]}"; do
    echo -e "  Downloading ${BOLD}${name}${NC}..."
    echo -e "  ${CYAN}↳ $url${NC}"
    # Use curl with browser UA to handle MediaFire/Dropbox redirects
    if curl -L --silent --show-error \
        -A "Mozilla/5.0 (Android 13; Mobile)" \
        --max-time 300 \
        -o "$file" "$url"; then
      # Verify it's actually a zip
      if unzip -t "$file" &>/dev/null; then
        echo -ne "  Extracting... "
        unzip -o -q "$file" -d "$dest" && echo -e "${GREEN}✓ Done${NC}" && success=true && break
        echo -e "${RED}✗ extract failed${NC}"
      else
        echo -e "  ${RED}✗ Not a valid zip (redirect/HTML page). Trying backup...${NC}"
        rm -f "$file"
      fi
    else
      echo -e "  ${RED}✗ Download failed. Trying backup...${NC}"
    fi
  done

  if [ "$success" = false ]; then
    echo -e "  ${RED}✗ All mirrors failed for ${name}.${NC}"
    echo -e "  ${YELLOW}  → Download manually. See bios/README.md${NC}"
  fi
  echo ""
}

# PS1 BIOS — archive.org primary (reliable), MediaFire + Dropbox as fallback
download_and_extract \
  "PS1_BIOS" \
  "" \
  "$BIOS/PS1" \
  "https://archive.org/download/redump-sony-playstation-bios/PS1_BIOS.zip" \
  "https://www.dropbox.com/sh/l0a18zplh1ndlo0/AAA_j4N-OO07owQB1embW_2Za?dl=1" \
  "http://www.mediafire.com/download/s11dvh2snfrmy29/PS1_BIOS.zip"

# PS2 BIOS — catbox is direct/reliable
download_and_extract \
  "PS2_BIOS" \
  "" \
  "$BIOS/PS2" \
  "https://files.catbox.moe/7kfx59.zip" \
  "https://archive.org/download/ps2-bios-megadump/ps2-bios-megadump.zip"

# NDS BIOS — Mega can't be wget'd; use archive.org
download_and_extract \
  "NDS_BIOS" \
  "" \
  "$BIOS/NDS" \
  "https://archive.org/download/nds-bios-firmware/NDS_BIOS.zip" \
  "https://www.dropbox.com/sh/s6fkz3uzddrokej/AAB-wc2ylp04cJkmN62Sqq04a?dl=1"

# GBA BIOS — archive.org primary, MediaFire fallback
download_and_extract \
  "GBA_BIOS" \
  "" \
  "$BIOS/GBA" \
  "https://archive.org/download/gba-bios-pack/gba_bios.zip" \
  "https://www.dropbox.com/sh/75ciyaphel7c5la/AABADloONTLeLBGyhOtn6HUba?dl=1" \
  "http://www.mediafire.com/download/uijj3i3349h8j2j/gba_bios.zip"

# 3DS System Files — aes_keys + nand system data for Azahar/Citra
download_and_extract \
  "3DS_BIOS" \
  "" \
  "$BIOS/3DS" \
  "https://archive.org/download/3ds-system-files-pack/3ds_system_files.zip" \
  "https://files.catbox.moe/r4t2wn.zip"

# Switch Keys — prod.keys + title.keys for Sudachi/Eden
# Note: keys are console-specific; these are community-shared dumps
download_and_extract \
  "Switch_Keys" \
  "" \
  "$BIOS/Switch" \
  "https://archive.org/download/nintendo-switch-keys/switch_keys.zip" \
  "https://files.catbox.moe/n7xrp3.zip"

# RetroArch BIOS pack (large ~500MB — optional)
echo ""
echo -ne "  ${BOLD}Download RetroArch all-in-one BIOS pack? (~500MB) [y/N]:${NC} "
read -r RETRO_PACK
if [[ "$RETRO_PACK" =~ ^[Yy]$ ]]; then
  mkdir -p "$BASE/RetroArch/system"
  download_and_extract \
    "RetroArch_BIOS_Pack" \
    "" \
    "$BASE/RetroArch/system" \
    "https://github.com/Abdess/retrobios/releases/download/v2026.03.17/Lakka_RetroArch_BIOS_Pack.zip"
fi

# ── Helper: get latest APK URL from a GitHub repo ────────────
get_github_apk_url() {
  local repo="$1"
  local pattern="${2:-\.apk}"
  curl -s "https://api.github.com/repos/${repo}/releases/latest" \
    | grep -o '"browser_download_url":"[^"]*'"$pattern"'[^"]*"' \
    | head -1 \
    | cut -d '"' -f 4
}

# ── Helper: download APK and trigger system installer ─────────
sideload_apk() {
  local name="$1"
  local url="$2"
  local apk_file="$DOWNLOADS/${name}.apk"

  if [ -z "$url" ]; then
    echo -e "  ${RED}✗ Could not resolve APK URL for ${name} — check GitHub manually${NC}"
    return
  fi

  echo -e "  ${CYAN}↓${NC} ${BOLD}${name}${NC}"
  echo -e "    ${CYAN}$url${NC}"

  if curl -L --silent --show-error \
      -A "Mozilla/5.0 (Android 13; Mobile)" \
      --max-time 300 \
      -o "$apk_file" "$url"; then
    # Verify it's actually an APK (zip-based)
    if unzip -t "$apk_file" &>/dev/null; then
      echo -e "  ${GREEN}✓ Downloaded${NC} → launching installer..."
      # termux-open is most reliable; fall back to am start
      termux-open "$apk_file" 2>/dev/null || \
        am start -a android.intent.action.VIEW \
          -d "file://$apk_file" \
          -t "application/vnd.android.package-archive" 2>/dev/null || \
        echo -e "  ${YELLOW}  → Install manually: $apk_file${NC}"
      sleep 5  # Give the user time to approve before next install
    else
      echo -e "  ${RED}✗ File doesn't look like a valid APK${NC}"
    fi
  else
    echo -e "  ${RED}✗ Download failed for ${name}${NC}"
  fi
  echo ""
}

# ── Auto-sideload emulator APKs ───────────────────────────────
echo ""
echo -e "${BOLD}[4/4] Downloading & installing emulators...${NC}"
echo -e "${YELLOW}      Approve each installer prompt as it appears${NC}"
echo -e "${YELLOW}      (Enable 'Install unknown apps' for Termux if prompted)${NC}"
echo ""

echo -e "  ${BOLD}Fetching latest release info from GitHub...${NC}"

# Resolve latest APK URLs dynamically
DUCKSTATION_URL=$(get_github_apk_url "stenzek/duckstation" "arm64-v8a-release\.apk")
MELONDS_URL=$(get_github_apk_url "melonDS-emu/melonDS-android" "\.apk")
RETROARCH_URL=$(get_github_apk_url "libretro/RetroArch" "RetroArch_aarch64\.apk")
PPSSPP_URL=$(get_github_apk_url "hrydgard/ppsspp" "arm64-v8a\.apk")
MUPEN_URL=$(get_github_apk_url "fzurita/mupen64plus-ae" "arm64\.apk")
AZAHAR_URL=$(get_github_apk_url "azahar-emu/azahar" "arm64-v8a\.apk")
SUDACHI_URL=$(get_github_apk_url "sudachi-emu/sudachi" "arm64-v8a\.apk")
echo ""

# PS1
sideload_apk "DuckStation"     "$DUCKSTATION_URL"
# NDS
sideload_apk "melonDS"         "$MELONDS_URL"
# SNES / GBA / multi-system
sideload_apk "RetroArch"       "$RETROARCH_URL"
# PSP
sideload_apk "PPSSPP"          "$PPSSPP_URL"
# N64
sideload_apk "Mupen64Plus_FZ"  "$MUPEN_URL"
# 3DS
sideload_apk "Azahar_3DS"      "$AZAHAR_URL"
# Switch
sideload_apk "Sudachi_Switch"  "$SUDACHI_URL"

# PS2 — NetherSX2 requires manual patching, can't auto-resolve a clean APK URL
echo -e "  ${YELLOW}PS2 (NetherSX2):${NC} requires manual patch step"
echo -e "  ${BOLD}https://github.com/Trixarian/NetherSX2-patch${NC}"
echo ""
# DraStic (paid Play Store app — can't sideload)
echo -e "  ${YELLOW}NDS alt — DraStic (paid):${NC}"
echo -e "  ${BOLD}https://play.google.com/store/apps/details?id=com.dsemu.drastic${NC}"
echo ""
# MyBoy (paid Play Store)
echo -e "  ${YELLOW}GBA alt — MyBoy! (paid):${NC}"
echo -e "  ${BOLD}https://play.google.com/store/apps/details?id=com.fastemulator.gba${NC}"
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
echo -e "  1. Approve any pending installer prompts above"
echo -e "  2. Drop ROMs into the matching folder under $ROMS"
echo -e "  3. Point each emulator to its BIOS folder under $BIOS"
echo -e "  4. If controller not working → read CONTROLLER_FIX.md in the repo"
echo ""
echo -e "  ${CYAN}Repo: https://github.com/00cyre/odin3-emu-setup${NC}"
echo ""
