import 'package:flutter/material.dart';
import '../generated/build_config.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/transactions_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/wallet_screen.dart';

class ScreenRegistry {
  static final Map<String, WidgetBuilder> _allScreens = {
    'Login': (context) => const LoginScreen(),
    'Home': (context) => const HomeScreen(),
    'Profile': (context) => const ProfileScreen(),
    'Settings': (context) => const SettingsScreen(),
    'Dashboard': (context) => const DashboardScreen(),
    'Transactions': (context) => const TransactionsScreen(),
    'Notifications': (context) => const NotificationsScreen(),
    'trustwallet': (context) => const WalletScreen(),
  };

  static List<String> get enabledScreens => BuildConfig.screens;

  static Map<String, WidgetBuilder> get screens {
    final enabled = enabledScreens;
    return Map.fromEntries(
      _allScreens.entries.where((e) => enabled.contains(e.key)),
    );
  }

  static WidgetBuilder? getScreen(String name) => _allScreens[name];

  static bool hasScreen(String name) => enabledScreens.contains(name);
}
