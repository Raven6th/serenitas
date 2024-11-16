import 'package:flutter/material.dart';
import 'package:serenitas/pages/appearance_page.dart';
import 'package:serenitas/pages/chat_page.dart';
import 'package:serenitas/pages/home_page.dart';
import 'package:serenitas/pages/login_page.dart';
import 'package:serenitas/pages/profile_page.dart';
import 'package:serenitas/pages/register_page.dart';
import 'package:serenitas/pages/setting_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serenitas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
      routes: {
        '/profile': (context) => const ProfilePage(),
        '/appearance': (context) => const AppearancePage(),
        '/home': (context) =>  MyHomePage(),
        '/chat': (context) => const MyChatRoomPage(),
        '/setting': (context) => const MySettingsPage(),
        '/login': (context) => const MyLoginPage(),
        '/register': (context) => const MySignUpPage(),

      },
    );
  }
}