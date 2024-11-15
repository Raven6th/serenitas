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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Row(
          children: [
            Icon(Icons.person_add),
            SizedBox(width: 20),
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          MyTextField(
            controller: usernameController,
            hint: 'Masukkan Username Anda...',
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
            label: 'Konfirmasi password',
            onvisibility: _togglePasswordVisibility,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Radio<String>(
                value: 'Cowo', // Nilai yang akan disimpan jika dipilih
                groupValue: _selectedGender, // Grup nilai radio button
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value; // Mengubah nilai yang dipilih
                  });
                },
              ),
              Text(
                'Laki-laki',
              ),
            ],
          ),
          Row(children: [
            Radio<String>(
              value: 'Cewe', // Nilai yang akan disimpan jika dipilih
              groupValue: _selectedGender, // Grup nilai radio button
              onChanged: (value) {
                setState(() {
                  _selectedGender = value; // Mengubah nilai yang dipilih
                });
              },
            ),
            Text(
              'Cewe',
            ),
          ]),
          const SizedBox(height: 20),
          // Container(
          //   width: double.infinity,
          //   padding: EdgeInsets.symmetric(horizontal: 20),
          //   child: ElevatedButton(
          //     onPressed: _signUp,
          //     child: const Text('Sign Up'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
