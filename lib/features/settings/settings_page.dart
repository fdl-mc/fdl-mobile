import 'package:fdl_app/features/auth/providers.dart';
import 'package:fdl_app/shared/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:url_launcher/url_launcher.dart';

class SettignsPage extends ConsumerWidget {
  const SettignsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return SettingsScreen(title: 'Settings', children: [
      SettingsGroup(
        title: 'Account settings',
        children: <Widget>[
          SimpleSettingsTile(
            title: 'Sign out',
            subtitle: '',
            leading: const Icon(Icons.logout),
            onTap: () => context.read(authServiceProvider).signOut(),
          ),
        ],
      ),
      SettingsGroup(
        title: 'Other',
        children: <Widget>[
          SimpleSettingsTile(
            title: 'Support us!',
            subtitle: '',
            leading: const Icon(Icons.savings),
            onTap: () => launch('https://donate.stream/arslee'),
          ),
          SimpleSettingsTile(
            title: 'About',
            subtitle: '',
            leading: const Icon(Icons.info),
            onTap: () => showAboutDialog(
              context: context,
              applicationLegalese: 'Official FreedomLand ecosystem app.',
              applicationIcon: const Icon(CustomIcons.fdl_icon),
            ),
          ),
        ],
      ),
    ]);
  }
}
