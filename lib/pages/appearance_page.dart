import 'package:flutter/material.dart';

class AppearancePage extends StatefulWidget {
  const AppearancePage({super.key});

  @override
  State<AppearancePage> createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Appearance'),
      ),
      body: Column(
        children: [
          // SwitchListTile(
          //   activeColor: Colors.blueAccent,
          //   inactiveThumbColor: Colors.grey,
          //   value: isDarkMode,
          //   onChanged: () {},
          //   title: const Text('Enable Dark Mode'),
          //   secondary: const Icon(Icons.dark_mode, color: Colors.black),
          // ),
          ListTile(
            leading: const Icon(Icons.color_lens, color: Colors.black),
            title: const Text('Theme Colors'),
            onTap: () {
              // Add theme customization logic
            },
          ),
        ],
      ),
    );
  }
}
