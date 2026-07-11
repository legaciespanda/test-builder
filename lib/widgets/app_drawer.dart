import 'package:flutter/material.dart';
import '../generated/build_config.dart';
import '../models/screen_registry.dart';

class AppDrawer extends StatelessWidget {
  final String currentRoute;

  const AppDrawer({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    final screens = ScreenRegistry.screens;

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade700, Colors.blue.shade500],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: Text(
              BuildConfig.appName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(BuildConfig.appName),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.business, color: Colors.blue.shade700, size: 32),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: screens.length,
              itemBuilder: (context, index) {
                final entry = screens.entries.elementAt(index);
                final isSelected = currentRoute == entry.key;

                IconData icon;
                switch (entry.key) {
                  case 'Login':
                    icon = Icons.login;
                    break;
                  case 'Home':
                    icon = Icons.home;
                    break;
                  case 'Profile':
                    icon = Icons.person;
                    break;
                  case 'Settings':
                    icon = Icons.settings;
                    break;
                  case 'Dashboard':
                    icon = Icons.dashboard;
                    break;
                  case 'Transactions':
                    icon = Icons.receipt_long;
                    break;
                  case 'Notifications':
                    icon = Icons.notifications;
                    break;
                  case 'trustwallet':
                    icon = Icons.account_balance_wallet;
                    break;
                  default:
                    icon = Icons.circle;
                }

                return ListTile(
                  leading: Icon(icon, color: isSelected ? Colors.blue.shade700 : Colors.grey),
                  title: Text(
                    entry.key,
                    style: TextStyle(
                      color: isSelected ? Colors.blue.shade700 : Colors.black87,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  selected: isSelected,
                  selectedTileColor: Colors.blue.shade50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  onTap: () {
                    Navigator.pop(context);
                    if (!isSelected) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: entry.value),
                      );
                    }
                  },
                );
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.grey),
            title: const Text('About', style: TextStyle(color: Colors.grey)),
            onTap: () {
              Navigator.pop(context);
              showAboutDialog(
                context: context,
                applicationName: BuildConfig.appName,
                applicationVersion: BuildConfig.versionName,
                applicationIcon: const Icon(Icons.android, size: 48, color: Colors.green),
                // children: [
                //   const SizedBox(height: 16),
                //   Text('Company: ${BuildConfig.companyName}'),
                //   Text('Email: ${BuildConfig.companyEmail}'),
                //   if (BuildConfig.companyWebsite.isNotEmpty)
                //     Text('Website: ${BuildConfig.companyWebsite}'),
                // ],
              );
            },
          ),
        ],
      ),
    );
  }
}
