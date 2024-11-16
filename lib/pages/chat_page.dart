import 'package:flutter/material.dart';
import 'package:serenitas/widgets/side_navbar.dart';

class MyChatRoomPage extends StatefulWidget {
  const MyChatRoomPage({super.key});

  @override
  State<MyChatRoomPage> createState() => _MyChatRoomPageState();
}

class _MyChatRoomPageState extends State<MyChatRoomPage> {
  final List<Map<String, String>> messages = [
    {"text": "Halo!", "sender": "Serenitas"}
  ];

  final TextEditingController _chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text('Chat Room'),
        centerTitle: true,
      ),
      body: Column(
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
                  onPressed: _sendMessage,
                ),
              ),
              onSubmitted: (_) => _sendMessage(),
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

  // Method to handle sending a message
  void _sendMessage() {
    if (_chatController.text.isNotEmpty) {
      setState(() {
        messages.add({
          "text": _chatController.text,
          "sender": "User",
        });
      });
      _chatController.clear();
    }
  }

  // Method to build a chat bubble with sender name and message
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
            // Display sender name
            Text(
              sender,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isUser ? Colors.blueAccent : Colors.grey[600],
                fontSize: 12.0,
              ),
            ),
            const SizedBox(height: 4.0),
            // Display the message in a bubble
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
}
