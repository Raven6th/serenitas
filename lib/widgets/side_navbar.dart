import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final String username;
  final String gender;
  final String imagepath;
  final Color boxColor;
  final List<Map<String, String>> buttons;

  const CustomDrawer({
    Key? key,
    required this.username,
    required this.gender,
    required this.imagepath,
    required this.boxColor,
    required this.buttons,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(widget.imagepath),
            ),
            accountName: Text(widget.username),
            accountEmail: Text(widget.gender),
            decoration: BoxDecoration(color: widget.boxColor),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.buttons.length,
              itemBuilder: (context, index) {
                final button = widget.buttons[index];
                return ListTile(
                  title: Text(button['name'] ?? 'Unknown'),
                  onTap: () {
                    Navigator.pushNamed(context, button['target'] ?? '/');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
