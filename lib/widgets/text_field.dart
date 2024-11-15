import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  const MyTextField(
    {
      super.key,
      required this.controller,
      required this.hint,
      required this.label,
    }
  );

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 223, 220, 220),
        labelText: widget.label,
        labelStyle: GoogleFonts.poppins(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
        hintText: widget.hint,
        hintStyle: GoogleFonts.poppins(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}