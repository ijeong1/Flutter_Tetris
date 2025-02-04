# 🎮 Fluttris

A classic Tetris game built with Flutter using the **MVVM pattern** and **Dependency Injection (IoC)**.  
Run it on iOS, Android, or any Flutter-supported platform!

![Tetris Gameplay](screenshots/gameplay.gif) *(Replace with your own screenshot)*

---

## ✨ Features
- **MVVM Architecture**: Clean separation of UI, business logic, and data.
- **Dependency Injection**: Uses `get_it` for IoC (Inversion of Control).
- **Level Progression**: Speed increases with score.
- **Game Over Screen**: Restart functionality included.
- **Responsive Controls**: Left/Right movement, rotation, and hard drop.
- **Score Tracking**: Points for cleared lines.

---

## 📦 Dependencies
``yaml
dependencies:
  flutter:
    sdk: flutter
  get_it: ^7.2.0  # For dependency injection

---

## 🛠️ Installation
` git clone https://github.com/ijeong1/Flutter_Tetris.git
` cd fluttris
` flutter pub get
` flutter run

---
## 🗂️ Project Structure
lib/
├── models/
│   └── tetris_model.dart       # Game logic & data models
├── services/
│   ├── tetris_service.dart     # Service implementation
│   └── itetris_service.dart    # Service interface
├── viewmodels/
│   └── tetris_viewmodel.dart   # Business logic & state management
├── views/
│   └── tetris_view.dart        # UI components
└── main.dart                   # App entry & DI setup
