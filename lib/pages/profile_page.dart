import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Avatar and Username
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/user_avatar.png'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Username',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 32),
          ListTile(
            leading: const Icon(Icons.edit, color: Colors.black),
            title: const Text('Change Profile Picture'),
            onTap: () {
              // Handle profile picture change
            },
          ),
        ],
      ),
    );
  }
}
