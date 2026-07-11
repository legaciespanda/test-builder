# Flutter Template App

A sample Flutter template that works with the **Flutter APK Builder** (GitHub CI/CD edition).

## Features

- **8 configurable screens**: Login, Home, Profile, Settings, Dashboard, Transactions, Notifications, Wallet
- **Screen registry pattern**: Screens are conditionally included based on the `screens` config from the builder
- **Dynamic theming**: App name, company info, and branding pulled from build config
- **Material 3 design** with Google Fonts
- **Responsive layout** optimized for mobile

## Screenshots

| Splash | Home | Login | Dashboard |
|--------|------|-------|-----------|
| Animated splash with company branding | Balance card + quick actions + activity feed | Email/password with biometric option | Stats cards + progress bars |

| Profile | Settings | Transactions | Wallet |
|---------|----------|--------------|--------|
| User info + verification status | Toggle preferences + security | Filterable list with income/expense summary | Credit card UI + quick transfers |

## How It Works with the Builder

When the builder triggers a GitHub Actions workflow:

1. **Config is uploaded** to `assets/config/build.json`
2. **Logo is uploaded** to `assets/config/logo.png`
3. The workflow:
   - Reads the config
   - Patches `build.gradle`, `AndroidManifest.xml`, `strings.xml`
   - Copies logo to all `mipmap-*` directories
   - Generates `lib/generated/build_config.dart` from the config
4. Flutter reads `BuildConfig.screens` to decide which screens to include
5. APK is built and uploaded as artifact

## Screen Registry

```dart
// lib/models/screen_registry.dart
class ScreenRegistry {
  static List<String> get enabledScreens => BuildConfig.screens;
  // Only screens listed in the builder config are available
}
```

## Project Structure

```
lib/
├── main.dart                    # Entry point
├── app.dart                     # MaterialApp with dynamic theme
├── generated/
│   └── build_config.dart        # Auto-generated from builder config
├── models/
│   └── screen_registry.dart     # Screen availability logic
├── widgets/
│   └── app_drawer.dart          # Navigation drawer with conditional items
└── screens/
    ├── splash_screen.dart       # Animated splash with company branding
    ├── login_screen.dart        # Email/password login
    ├── home_screen.dart         # Balance + quick actions + activity
    ├── profile_screen.dart      # User profile + verification
    ├── settings_screen.dart     # Preferences + security
    ├── dashboard_screen.dart    # Stats + progress bars
    ├── transactions_screen.dart # Transaction history
    ├── notifications_screen.dart # Notification list
    └── wallet_screen.dart       # Credit cards + transfers
```

## Setup

### 1. Push to GitHub

```bash
git init
git add .
git commit -m "Initial template"
git remote add origin https://github.com/YOUR_USERNAME/flutter-template-repo.git
git push -u origin main
```

### 2. Configure the Builder

In your builder server's `.env`:
```
GITHUB_REPO=YOUR_USERNAME/flutter-template-repo
GITHUB_WORKFLOW_ID=build-apk.yml
```

### 3. Test Locally

```bash
flutter pub get
flutter run
```

## Customizing

### Add a New Screen

1. Create `lib/screens/my_new_screen.dart`
2. Register it in `lib/models/screen_registry.dart`:
```dart
'MyNew': (context) => const MyNewScreen(),
```
3. Add icon mapping in `lib/widgets/app_drawer.dart`
4. The builder's screen checkbox will automatically include it

### Change Default Colors

Edit `lib/app.dart`:
```dart
colorScheme: ColorScheme.fromSeed(
  seedColor: Colors.purple,  // Change this
  brightness: Brightness.light,
),
```

## Dependencies

- `google_fonts` — Typography
- `flutter_svg` — SVG support
- `shared_preferences` — Local storage
- `http` — Network requests
- `intl` — Date/number formatting

## License

MIT
