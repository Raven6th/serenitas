import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serenitas/widgets/side_navbar.dart';
import 'package:serenitas/controller/account.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  bool isLoggedIn = false; 
  final TextEditingController _chatController = TextEditingController();

  void _logout(BuildContext context) {
    final accountData = Provider.of<AccountData>(context, listen: false);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Apakah anda ingin logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                accountData.logout();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final accountData = Provider.of<AccountData>(context);
    final isLoggedIn = accountData.currentUser != null;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text('Serenitas'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () {
                if (isLoggedIn) {
                  _logout(context);
                } else {
                  Navigator.pushNamed(context, '/login');
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  isLoggedIn ? 'Logout' : 'Login',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
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
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(),
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
        imagepath: 'assets/images/profile.jpg',
        boxColor: Colors.purple,
        buttons: [
          {'name': 'Chat', 'target': '/chat'},
          {'name': 'Pengaturan', 'target': '/setting'},
        ],
      ),
    );
  }
}
