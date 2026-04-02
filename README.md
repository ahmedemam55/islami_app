# 🕌 Islami — Islamic App

A comprehensive Islamic Flutter application that includes the Holy Quran, Hadiths, digital Tasbih counter, Quran Radio, and full settings support.

---

## ✨ Features

| Screen | Description |
|--------|-------------|
| 🌟 **Splash** | Animated splash screen with rotating golden rings and a 3-second loading bar |
| 📖 **Quran** | Browse all 114 Surahs and read each Surah's verses |
| 📜 **Hadith** | Browse and read the Prophet's Hadiths with full details |
| 📿 **Tasbih** | Interactive digital Tasbih counter with rotation animation and haptic feedback |
| 📻 **Radio** | Quran live radio stream player with play/pause controls |
| ⚙️ **Settings** | Switch language (Arabic/English) and theme (Light/Dark) |

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
