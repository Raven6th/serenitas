import 'package:flutter/material.dart';
import 'package:serenitas/widgets/side_navbar.dart';

class MyHomePage extends StatefulWidget {
  final TextEditingController? chat;
  MyHomePage({super.key, this.chat});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text('Serenitas'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.chat_bubble_outline,
                    size: 100,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Selamat datang di Serenitas!',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.black87,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Ayo ceritakan masalahmu!',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _chatController,
              decoration: InputDecoration(
                hintText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    print('Anda: ${_chatController.text}');
                    _chatController.clear();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(
        username: 'Username',
        gender: 'Gender',
        imagepath: 'assets/images/profile.jpg',
        boxColor: Colors.purple,
        buttons: [
          {'name': 'Pengaturan', 'target': '/setting'},
          {'name': 'Login', 'target': '/login'},
          {'name': 'Register', 'target': '/register'},
        ],
      ),
    );
  }
}
