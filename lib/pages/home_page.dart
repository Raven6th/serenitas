import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serenitas/controller/chat.dart';
import 'package:serenitas/controller/predict.dart';
import 'package:serenitas/widgets/side_navbar.dart';
import 'package:serenitas/controller/account.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final TextEditingController _chatController = TextEditingController();

  final List<String> _mentalHealthSuggestions = [
    "Bagaimana saya bisa manajemen stress dengan efektif?",
    "Apa saja tips untuk tidur yang lebih nyenyak?",
    "Bagaimana cara mengatasi kecemasan?",
    "Apa saja cara untuk tetap termotivasi?",
    "Dapatkah Anda membantu saya melatih perhatian penuh?",
    "Bagaimana cara meningkatkan kesehatan mental saya?",
    "Apa saja tanda-tanda kelelahan?s",
    "Bagaimana cara membangun rutinitas harian yang positif?",
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatController>(
      builder: (context, chatController, child) {
        final isInChatRoom = chatController.isInChatRoom;
        final accountData = Provider.of<AccountData>(context);
        final isLoggedIn = accountData.currentUser != null;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purpleAccent,
            title: Text(isInChatRoom ? 'Chat Room' : 'Serenitas'),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextButton(
                  onPressed: () {
                    if (isLoggedIn) {
                      _logout(context, accountData);
                    } else {
                      Navigator.pushNamed(context, '/login');
                    }
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          body: isInChatRoom
              ? _buildChatRoom(context)
              : _buildWelcomeScreen(context, chatController),
          drawer: CustomDrawer(
            imagepath: 'assets/images/profile.jpg',
            boxColor: Colors.purple,
            buttons: [
              {'name': 'Pengaturan', 'target': '/setting'},
            ],
          ),
        );
      },
    );
  }

  Widget _buildWelcomeScreen(
      BuildContext context, ChatController chatController) {
    return Column(
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
                  'Ketik pesan untuk memulai atau pilih pertanyaan di bawah!',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                _buildSuggestions(context, chatController),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _chatController,
            decoration: InputDecoration(
              hintText: 'Ketik pesan anda...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _handlePrediction(
                  context,
                  _chatController.text,
                  chatController,
                ),
              ),
            ),
            onSubmitted: (value) =>
                _handlePrediction(context, value, chatController),
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestions(
      BuildContext context, ChatController chatController) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 58, 58, 58),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _mentalHealthSuggestions.map((suggestion) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color.fromARGB(255, 41, 0, 88),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.0),
                    onTap: () => _handlePrediction(
                      context,
                      suggestion,
                      chatController,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Text(
                        suggestion,
                        style: const TextStyle(),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _handlePrediction(BuildContext context, String input,
      ChatController chatController) async {
    if (input.isEmpty) return;

    final predictionProvider = Provider.of<PredictionProvider>(context, listen: false);

    chatController.switchToChatRoom();
    chatController.addMessage(input, "User");

    // Clear TextField if necessary
    _chatController.clear();

    // Fetch prediction
    await predictionProvider.getPrediction(input);
    final response = predictionProvider.lastResponse ?? "Tidak ada respon.";
    chatController.addMessage(response, "Pandora");
  }

  Widget _buildChatRoom(BuildContext context) {
    final chatController = Provider.of<ChatController>(context);
    final messages = chatController.messages;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return _buildChatBubble(
                messages[index]['text']!,
                messages[index]['sender']!,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _chatController,
            decoration: InputDecoration(
              hintText: 'Ketik pesan anda...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _handlePrediction(
                  context,
                  _chatController.text,
                  chatController,
                ),
              ),
            ),
            onSubmitted: (value) =>
                _handlePrediction(context, value, chatController),
          ),
        ),
      ],
    );
  }

  Widget _buildChatBubble(String message, String sender) {
    bool isUser = sender == "User";
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isUser ? Colors.blueAccent : Colors.grey[600],
                fontSize: 12.0,
              ),
            ),
            const SizedBox(height: 4.0),
            Material(
              color: isUser ? Colors.blueAccent : Colors.grey[300]!,
              borderRadius: BorderRadius.circular(12.0),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  message,
                  style: TextStyle(
                    color: isUser ? Colors.white : Colors.black87,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context, AccountData accountData) {
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
}
