import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/color.dart';
import '../../../core/theme/text_style.dart';
import '../widgets/settings_section.dart';
import '../widgets/settings_switch_tile.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          children: const [
            SettingsSection(
              title: 'APP SETTINGS',
              children: [
                _DarkModeTile(),
                _NotificationTile(),
                _LanguageTile(),
              ],
            ),
            SizedBox(height: 24),
            SettingsSection(
              title: 'SUPPORT',
              children: [
                _HelpTile(),
                _PrivacyTile(),
              ],
            ),
            SizedBox(height: 32),
            Center(
              child: Text(
                'Version 1.0.0',
                style: AppTextStyles.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _DarkModeTile extends StatefulWidget {
  const _DarkModeTile();

  @override
  State<_DarkModeTile> createState() => _DarkModeTileState();
}

class _DarkModeTileState extends State<_DarkModeTile> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return SettingsSwitchTile(
      icon: Icons.nightlight_round,
      iconBg: AppColors.secondaryLight,
      title: 'Dark Mode',
      value: value,
      onChanged: (v) => setState(() => value = v),
    );
  }
}

class _NotificationTile extends StatefulWidget {
  const _NotificationTile();

  @override
  State<_NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<_NotificationTile> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return SettingsSwitchTile(
      icon: Icons.notifications_none,
      iconBg: AppColors.secondaryLight,
      title: 'Notifications',
      value: value,
      onChanged: (v) => setState(() => value = v),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile();

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      icon: Icons.language,
      iconBg: AppColors.secondaryLight,
      title: 'Language',
      trailing: Text(
        'English',
        style: AppTextStyles.bodySecondary,
      ),
      onTap: () {},
    );
  }
}

class _HelpTile extends StatelessWidget {
  const _HelpTile();

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      icon: Icons.help_outline,
      iconBg: AppColors.secondaryLight,
      title: 'Help & FAQ',
      onTap: () {},
    );
  }
}

class _PrivacyTile extends StatelessWidget {
  const _PrivacyTile();

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      icon: Icons.privacy_tip_outlined,
      iconBg: AppColors.secondaryLight,
      title: 'Privacy Policy',
      onTap: () {},
    );
  }
}







