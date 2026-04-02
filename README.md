# 🕌 Islami — Islamic App

A comprehensive Islamic Flutter application that includes the Holy Quran, Hadiths, digital Tasbih counter, Quran Radio, and full settings support.

---

## ✨ Features

| Screen | Description |
|--------|-------------|
| 🌟 **Splash** | Simple animated splash screen with a centered logo and a 3-second timer |
| 📖 **Quran** | Browse all 114 Surahs and read each Surah's verses |
| 📜 **Hadith** | Browse and read the Prophet's Hadiths with full details |
| 📿 **Tasbih** | Interactive digital Tasbih counter with rotation animation and haptic feedback |
| 📻 **Radio** | Quran live radio stream player with play/pause controls |
| ⚙️ **Settings** | Switch language (Arabic/English) and theme (Light/Dark) |

---
## 📸 Screenshots
Below are the app's screenshots that highlight its functionality:

| Screen 1 | Screen 2 | Screen 3 | Screen 4 | Screen 5 | Screen 6 | Screen 7 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|<img width="200" alt="Screen 1" src=<img width="412" height="870" alt="Image" src="https://github.com/user-attachments/assets/d34a2c0e-1d78-42e4-9f42-7166747b486d" />
/>|<img width="200" alt="Screen 2" src=<img width="412" height="870" alt="Image" src="https://github.com/user-attachments/assets/fc443487-14bb-4ce9-8fd7-e541a28c3b1c" />
/>|<img width="200" alt="Screen 3" src=<img width="412" height="870" alt="Image" src="https://github.com/user-attachments/assets/116bbe70-cce8-451d-a11d-6ffda0771179" />
/>|<img width="200" alt="Screen 4" src=<img width="412" height="870" alt="Image" src="https://github.com/user-attachments/assets/ef93b5ef-b8fb-4bcc-94c3-03d1ec20c2cf" />
/>|<img width="200" alt="Screen 5" src=<img width="412" height="870" alt="Image" src="https://github.com/user-attachments/assets/42a98a12-a1a8-47b4-8887-b7d783e76a86" />
/>|<img width="200" alt="Screen 6" src=<img width="412" height="870" alt="Image" src="https://github.com/user-attachments/assets/121fcc53-0ebc-4c80-8a50-fda60620cf2b" />
/>|<img width="200" alt="Screen 7" src=<img width="412" height="870" alt="Image" src="https://github.com/user-attachments/assets/1630a8a1-13ac-49d1-9049-238faeec8c95" />
/>|

| Screen 8 | Screen 9 | Screen 10 | Screen 11 | Screen 12 | Screen 13 | Screen 14 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|<img width="200" alt="Screen 8" src=<img width="412" height="870" alt="Image" src="https://github.com/user-attachments/assets/7eda8cb9-c14a-4153-b3b6-be4fdda7528d" />
/>|<img width="200" alt="Screen 9" src=<img width="412" height="870" alt="Image" src="https://github.com/user-attachments/assets/1c9cb874-ad75-40f0-be84-b27418630663" />
/>|<img width="200" alt="Screen 10" src=<img width="412" height="870" alt="Image" src="https://github.com/user-attachments/assets/d2c5fe48-ac94-4e9d-a8ae-296ef86fe4bf" />
/>|<img width="200" alt="Screen 11" src=<img width="412" height="870" alt="Image" src="https://github.com/user-attachments/assets/6fdff306-f431-4091-8138-6000f693a245" />
/>|<img width="200" alt="Screen 12" src=<img width="412" height="870" alt="Image" src="https://github.com/user-attachments/assets/e785cbea-846f-484f-aa7d-a1f6df2fb877" />
/>|<img width="200" alt="Screen 13" src=<img width="412" height="870" alt="Image" src="https://github.com/user-attachments/assets/f0568ad6-8d01-41b8-8e1b-c913a05c88c7" />
/>|<img width="200" alt="Screen 14" src=<img width="412" height="870" alt="Image" src="https://github.com/user-attachments/assets/69df884e-a746-4ca0-9ab4-3c82fa943f77" />
/>|
---

## 🛠️ Tech Stack

### State Management
- **Provider** — manages language and theme across the entire app

### Navigation
- **Navigator** with named routes

### Localization
- **Flutter Localization (ARB files)** — full Arabic and English support

### UI Packages
| Package | Usage |
|---------|-------|
| `google_fonts` | Amiri & Cairo fonts on the Splash screen |
| `animated_custom_dropdown` | Language and theme dropdowns in Settings |
| `flutter_bounceable` | Bounce animation on Hadith list items |

### Audio
- **just_audio** — live streaming for Quran Radio

---

## 🎨 Theme

| | Light | Dark |
|-|-------|------|
| Primary Color | `#B7935F` (Golden) | `#FACC1D` (Bright Gold) |
| Background | `default_bg.png` | `dark_bg.png` |
| Bottom Nav | Golden | `#141A2E` |
| Font | ElMessiri | ElMessiri |

---

## 📁 Project Structure

```
lib/
├── main.dart
├── core/
│   ├── setting_provider.dart       # Language & theme provider
│   └── theme/
│       └── app_theme_manager.dart  # Light & Dark themes
├── layout/
│   └── layout_view.dart            # Bottom Navigation Shell
├── features/
│   ├── splash/
│   │   └── splash_view.dart        # Animated splash screen
│   ├── quran/
│   │   ├── quran_view.dart         # Surah list
│   │   └── quran_details_view.dart # Surah verses
│   ├── hadeth/
│   │   ├── hadeth_view.dart        # Hadith list
│   │   └── hadeth_details_view.dart# Hadith details
│   ├── sebha/
│   │   └── sebha_view.dart         # Digital Tasbih counter
│   ├── radio/
│   │   └── radio_view.dart         # Quran radio player
│   └── settings/
│       └── settings_view.dart      # App settings
└── l10n/
    ├── app_ar.arb                  # Arabic strings
    └── app_en.arb                  # English strings
```

---

## 📦 Assets

```
assets/
├── images/           # Screen images and icons
├── icons/            # splash_logo.png
└── files/
    ├── 1.txt ~ 114.txt    # Verses for each Surah
    └── ahadeth.txt         # Hadith text file
```

---

## 🚀 Getting Started

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Build APK
flutter build apk --release
```

---

## 📋 Requirements

- Flutter SDK >= 3.0.0
- Dart >= 3.0.0
- Android: `INTERNET` permission in `AndroidManifest.xml`

---

## 👨‍💻 Developer

**Ahmed Emam**  
[GitHub](https://github.com/ahmedemam55)
