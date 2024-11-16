import 'package:flutter/material.dart';
import 'package:serenitas/widgets/password_fields.dart';
import 'package:serenitas/widgets/text_field.dart';

class MySignUpPage extends StatefulWidget {
  const MySignUpPage({super.key});

  @override
  State<MySignUpPage> createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool obscureText = true;
  String? _selectedGender;

  void _togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 157, 54, 175),
        title: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            MyTextField(
              controller: usernameController,
              hint: 'Masukkan username...',
              label: 'Username',
            ),
            const SizedBox(height: 20),
            MyPassWordField(
              controller: passwordController,
              obsecure: obscureText,
              label: 'Password',
              onvisibility: _togglePasswordVisibility,
            ),
            const SizedBox(height: 20),
            MyPassWordField(
              controller: confirmPasswordController,
              obsecure: obscureText,
              label: 'Konfirmasi Password',
              onvisibility: _togglePasswordVisibility,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                const Text('Male'),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Female',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // sign up/register
              },
              child: Text('Sign Up', style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}
