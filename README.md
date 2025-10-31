# Eclipt Stylish

A small mobile app technical task demonstrating Firebase Authentication, Cloud Firestore, clean architecture, and Riverpod state management.

## Features

- 🔐 **Authentication**: Sign up, login, and logout with Firebase Auth
- 🎨 **Onboarding Flow**: First-time user experience with smooth transitions
- 👤 **Profile Setup**: User profile completion with display name
- 🧭 **Smart Navigation**: Automatic routing based on auth and onboarding state
- 🎨 **Modern UI**: Custom theme with Google Fonts and SVG assets
- 🌍 **Localization**: Multi-language support with Flutter's l10n

## Architecture

This project follows **Clean Architecture** principles with three distinct layers:

### Data Layer
- **Models**: Data transfer objects with JSON serialization
- **Datasources**: Firebase Auth and Firestore implementations
- **Repository Implementations**: Concrete repository implementations

### Domain Layer
- **Entities**: Core business models (UserEntity)
- **Repositories**: Abstract contracts for data operations
- **Use Cases**: Business logic (SignInUsecase, SignUpUsecase, SignOutUsecase)

### Presentation Layer
- **Screens**: UI pages (Login, Sign Up, Home, Onboarding)
- **Widgets**: Reusable UI components (PasswordField, EmailField)
- **Providers**: Riverpod state management with code generation

## Project Structure

```
lib/
├── core/
│   ├── assets/          # Generated asset references
│   ├── base/            # Base classes (Error, Repository, UseCase)
│   ├── providers/       # Firebase providers
│   ├── router/          # GoRouter configuration and routes
│   ├── screens/         # Shared screens (Splash)
│   ├── storages/        # Secure and shared storage
│   └── theme/           # App theme and styling
│
├── features/            # Feature modules
│   ├── auth/            
│   ├── home/
│   └── onboarding/
│
├── l10n/                # Localization files
│   ├── app_en.arb
│   └── generated/
│
├── utils/              # Utilities and extensions
│   ├── ext/            # Context extensions
│   ├── logger/         # Logger configuration
│   └── scaffoldMessenger/  # Snackbar service
│
├── app.dart            # Main app widget
├── firebase_options.dart  # Firebase configuration
└── main.dart           # App entry point
```

## Tech Stack

- **Flutter**: 3.9.2+ | **Dart**: Latest stable
- **State Management**: Riverpod 3.0.3 + Flutter Hooks
- **Backend**: Firebase (Auth, Firestore)
- **Navigation**: GoRouter 16.3.0
- **Code Generation**: Riverpod Generator, Freezed, JSON Serializable
- **UI**: Google Fonts, Flutter SVG
- **Storage**: Secure Storage, Shared Preferences

## Quick Start

### Prerequisites
- Flutter SDK 3.9.2+
- Firebase account (free tier)

### Run project

1. **Clone and install dependencies**
```bash
git clone <repository-url>
cd eclipt_stylish
flutter pub get
```

2. **Generate code**
```bash
dart run build_runner build --delete-conflicting-outputs
```

3. **Run**
```bash
flutter run
```