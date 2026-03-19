# Scripts

## install.sh — Full Auto-Installer

Run this on your Odin 3 via **Termux** to set up everything automatically.

### First time setup

1. Install **Termux** from [F-Droid](https://f-droid.org/en/packages/com.termux/) (not Play Store — the Play Store version is outdated)
2. Open Termux and run:

```bash
termux-setup-storage
```

Accept the storage permission popup. Then:

```bash
pkg install wget -y
wget https://raw.githubusercontent.com/00cyre/odin3-emu-setup/main/scripts/install.sh
bash install.sh
```

### What it does

- ✅ Installs required tools (wget, unzip, curl)
- ✅ Creates full ROM folder structure under `/storage/emulated/0/Roms/`
- ✅ Creates BIOS folders under `/storage/emulated/0/BIOS/`
- ✅ Downloads PS1, PS2, GBA BIOS files automatically
- ⚠️ NDS BIOS must be downloaded manually (Mega link — can't auto-download)
- ✅ Optionally downloads the RetroArch all-in-one BIOS pack (~500MB)
- ✅ Prints all emulator Play Store / APK links

### create_folders.sh — Folders Only

Just creates the folder structure, no downloads.

```bash
bash create_folders.sh
```
