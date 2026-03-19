# 🎮 Controller Fix — AYN Odin 3

Games and Steam not recognizing the controller? Work through these steps.

---

## Step 1 — Set X-Input Mode on the Odin

1. Go to **Settings → Controller** on the Odin 3
2. Set mode to **X-Input** (not D-Input or Gamepad)
3. Restart the app/game

> X-Input is the standard used by Steam, most Android games, and RetroArch.

---

## Step 2 — Steam Input Settings

1. Open Steam → **Settings → Controller → General Controller Settings**
2. Enable:
   - ✅ Xbox Configuration Support
   - ✅ Generic Gamepad Configuration Support
3. Close and relaunch the game

### Per-game override

If a specific game still doesn't detect it:
- Right-click the game → **Properties → Controller**
- Set to **Force On**

---

## Step 3 — Game Hub / Game Native

1. Open **Game Hub** → Settings → Controller Settings
2. Make sure controller mapping is **enabled**
3. Toggle controller mode off → back on in AYN Settings while Game Hub is running
4. Relaunch the game from Game Hub

---

## Step 4 — AYN Tools App

The pre-installed **AYN Tools** app has controller remapping:

1. Open AYN Tools
2. Go to Controller section
3. **Reset to defaults**
4. Re-test in your game

---

## Step 5 — RetroArch Specific

1. Open RetroArch → **Settings → Input**
2. Go to **Input User 1 Binds**
3. Run **Bind All** to auto-detect the Odin controller
4. Save configuration

---

## Step 6 — Android-level Fix

Some games need the controller recognized at the Android level:

1. Go to Android **Settings → Accessibility** (or Developer Options)
2. Look for **Input** or **Physical keyboard** settings
3. Try toggling game controller support if available

---

## Still Not Working?

- Try the **[AYN Discord](https://discord.gg/ayn)** — active community with Odin-specific help
- Check the **AYN Tools** app for firmware/controller driver updates
