import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/theme_controller.dart';

class AppearancePage extends StatelessWidget {
  const AppearancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Appearance'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(
              Provider.of<ThemeModeData>(context).isDarkModeActive
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: Provider.of<ThemeModeData>(context).isDarkModeActive,
              onChanged: (bool value) {
                Provider.of<ThemeModeData>(context, listen: false).changeTheme(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
              },
            ),
            onTap: () {
              Provider.of<ThemeModeData>(context, listen: false).changeTheme(
                Provider.of<ThemeModeData>(context, listen: false)
                        .isDarkModeActive
                    ? ThemeMode.light
                    : ThemeMode.dark,
              );
            },
          ),
        ],
      ),
    );
  }
}
