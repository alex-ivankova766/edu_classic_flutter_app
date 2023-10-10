import 'package:flutter/material.dart';

import 'profile_view.dart';
import 'settings_view.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        right: false,
        child: Column(
          children: <Widget>[
            _AppMenuButton(
              icon: const Icon(Icons.account_circle),
              title: 'Profile',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileView()),
                );
              },
            ),
            _AppMenuButton(
              icon: const Icon(Icons.settings),
              title: 'Settings',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AppMenuButton extends StatelessWidget {
  final Icon icon;
  final String title;
  final Function() onPressed;
  const _AppMenuButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final canFitTitle = constraints.maxWidth > 180;

        return canFitTitle
            ? ListTile(
                leading: icon,
                title: Text(title),
                onTap: onPressed,
              )
            : IconButton(
                onPressed: onPressed,
                icon: icon,
              );
      },
    );
  }
}