# Windows 10 Microphone Toggle & Mute Scripts

This repository provides lightweight batch scripts (`.bat`) for Windows 10 to enable, disable, or toggle your system microphone without interrupting other core Windows services.

---

## 📁 Repository Contents

| File Name | Method / Mechanism | Description |
| :--- | :--- | :--- |
| `Disable_Mic.bat` | Hardware Driver (`Disable-PnpDevice`) | Fully disables or enables the microphone device driver at the system level via PowerShell. Requires Administrator privileges. |
| `Toggle_Mic_Mute.bat` | Audio Endpoint (`SoundVolumeView.exe`) | Safely toggles the microphone mute state at the software volume level without touching physical hardware drivers. Works seamlessly while background apps/services (Teams, Zoom, Discord) are running. |

---

## 🚀 Usage Instructions

### Method 1: Software Mute Toggle (`Toggle_Mic_Mute.bat`)
*Recommended for daily use — bypasses driver lock issues when microphone is actively in use.*

1. Download **[SoundVolumeView (64-bit)](https://www.nirsoft.net/utils/soundvolumeview-x64.zip)** from NirSoft.
2. Extract `SoundVolumeView.exe` into the same directory where `Toggle_Mic_Mute.bat` is located.
3. Double-click `Toggle_Mic_Mute.bat` to instantly toggle your microphone between **Muted** and **Unmuted**.

> **Note:** If your microphone device in Windows Sound settings is named something other than `"Microphone"` (e.g., `"Headset Microphone"`), open `Toggle_Mic_Mute.bat` in Notepad and update the line:
> ```bat
> SoundVolumeView.exe /Switch "Your Device Name"
> ```

---

### Method 2: Hardware Device Disable (`Disable_Mic.bat`)
*Completely disables the physical device driver in Device Manager.*

1. Open **Device Manager** (`Win + X` > `Device Manager`).
2. Expand **Audio inputs and outputs** and note your exact microphone name (e.g., `Microphone (Realtek High Definition Audio)`).
3. Open `Disable_Mic.bat` in Notepad and replace `YOUR MICROPHONE NAME` with your exact device name.
4. Right-click `Disable_Mic.bat` and select **Run as administrator**.

---

## ⚙️ Requirements

* **OS:** Windows 10 / Windows 11
* **Permissions:** Administrator privileges required for `Disable_Mic.bat` (Device Manager operations).
* **Dependencies:** `SoundVolumeView.exe` (only required for `Toggle_Mic_Mute.bat`).

---

## 📄 License
This project is open-source and free to use.
