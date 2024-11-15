import 'package:flutter/material.dart';
import 'package:serenitas/pages/chat_page.dart';
import 'package:serenitas/pages/home_page.dart';
import 'package:serenitas/pages/login_page.dart';
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
      home: MyChatRoomPage(),
    );
  }
}