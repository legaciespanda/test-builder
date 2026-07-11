import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _biometric = false;
  bool _darkMode = false;
  bool _location = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      drawer: const AppDrawer(currentRoute: 'Settings'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader('Preferences'),
          _buildSwitchTile(
            icon: Icons.notifications_active,
            title: 'Push Notifications',
            subtitle: 'Receive alerts and updates',
            value: _notifications,
            onChanged: (v) => setState(() => _notifications = v),
          ),
          _buildSwitchTile(
            icon: Icons.fingerprint,
            title: 'Biometric Login',
            subtitle: 'Use fingerprint or face ID',
            value: _biometric,
            onChanged: (v) => setState(() => _biometric = v),
          ),
          _buildSwitchTile(
            icon: Icons.dark_mode,
            title: 'Dark Mode',
            subtitle: 'Enable dark theme',
            value: _darkMode,
            onChanged: (v) => setState(() => _darkMode = v),
          ),
          _buildSwitchTile(
            icon: Icons.location_on,
            title: 'Location Services',
            subtitle: 'Allow location access',
            value: _location,
            onChanged: (v) => setState(() => _location = v),
          ),
          const SizedBox(height: 16),
          _buildSectionHeader('Security'),
          _buildActionTile(
            icon: Icons.lock,
            title: 'Change Password',
            onTap: () {},
          ),
          _buildActionTile(
            icon: Icons.security,
            title: 'Two-Factor Authentication',
            onTap: () {},
          ),
          _buildActionTile(
            icon: Icons.devices,
            title: 'Manage Devices',
            onTap: () {},
          ),
          const SizedBox(height: 16),
          _buildSectionHeader('Support'),
          _buildActionTile(
            icon: Icons.help_outline,
            title: 'Help Center',
            onTap: () {},
          ),
          _buildActionTile(
            icon: Icons.privacy_tip,
            title: 'Privacy Policy',
            onTap: () {},
          ),
          _buildActionTile(
            icon: Icons.description,
            title: 'Terms of Service',
            onTap: () {},
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text('Sign Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade500,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: SwitchListTile(
        secondary: Icon(icon, color: Colors.blue.shade700),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.blue.shade700,
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue.shade700),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
