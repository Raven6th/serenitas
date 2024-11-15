import 'package:flutter/material.dart';
import 'package:serenitas/widgets/text_field.dart';
import '../widgets/password_fields.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText; // Mengubah status visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Row(
          children: [
            // Icon(Icons.login),
            // SizedBox(
            //   width: 20,
            // ),
            Text(
              'Login',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MyTextField(
              controller: username,
              hint: 'Masukkan Username Anda...',
              label: 'Username',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MyPassWordField(
              controller: password,
              obsecure: obscureText,
              label: 'Password',
              onvisibility: _togglePasswordVisibility,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // child: ElevatedButton(
            //   onPressed: ,
            //   child: const Text('Login'),
            // ),
          ),
          const SizedBox(height: 20),
          // TextButton(
          //   onPressed: ,
          //   child: const Text('Tidak punya akun? Sign up!'),
          // ),
        ],
      ),
    );
  }
}
