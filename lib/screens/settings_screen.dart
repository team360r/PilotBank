import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/mock_data.dart';
import '../providers/auth_provider.dart';
import '../theme/app_colors.dart';

/// The settings screen displays user information, toggle preferences,
/// app information, and a sign-out action.
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _pushNotifications = true;
  bool _biometricLogin = false;
  bool _darkMode = false;

  void _signOut() {
    ref.read(authProvider.notifier).logout();
  }

  void _showAbout() {
    showAboutDialog(
      context: context,
      applicationName: 'PilotBank',
      applicationVersion: '1.0.0',
      applicationLegalese: 'Built with Flutter and AI assistance.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // User info section
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.primary.withValues(alpha: 0.05),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    mockUser.name.split(' ').map((n) => n[0]).join(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mockUser.name,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        mockUser.email,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Preferences section
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
            child: Text(
              'Preferences',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),

          SwitchListTile(
            title: const Text('Push notifications'),
            subtitle: const Text('Receive alerts for transactions'),
            value: _pushNotifications,
            onChanged: (value) =>
                setState(() => _pushNotifications = value),
          ),

          SwitchListTile(
            title: const Text('Biometric login'),
            subtitle: const Text('Use fingerprint or face to sign in'),
            value: _biometricLogin,
            onChanged: (value) =>
                setState(() => _biometricLogin = value),
          ),

          SwitchListTile(
            title: const Text('Dark mode'),
            subtitle: const Text('Switch to dark theme'),
            value: _darkMode,
            onChanged: (value) => setState(() => _darkMode = value),
          ),

          const Divider(),

          // About section
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About PilotBank'),
            onTap: _showAbout,
          ),

          const Divider(),

          // Sign out
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.error),
            title: const Text(
              'Sign out',
              style: TextStyle(color: AppColors.error),
            ),
            onTap: _signOut,
          ),
        ],
      ),
    );
  }
}
