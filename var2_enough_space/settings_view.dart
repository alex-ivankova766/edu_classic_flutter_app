import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Push notifications'),
            trailing: Switch(value: true, onChanged: (_) {}),
          ),
        ],
      ),
    );
  }
}