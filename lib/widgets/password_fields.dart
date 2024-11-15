import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPassWordField extends StatefulWidget {
  final TextEditingController controller;
  final bool obsecure;
  final Function() ? onvisibility;
  final String label;
  const MyPassWordField(
    {
      super.key,
      required this.controller,
      required this.obsecure,
      required this.onvisibility,
      required this.label,
    }
  );

  @override
  State<MyPassWordField> createState() => _MyPassWordFieldState();
}

class _MyPassWordFieldState extends State<MyPassWordField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obsecure, // Menyembunyikan teks
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 223, 220, 220),
        labelText: widget.label,
        labelStyle: GoogleFonts.poppins(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
        hintText: 'Masukkan kata sandi',
        hintStyle: GoogleFonts.poppins(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
        suffixIcon: IconButton(
          icon: Icon(
            widget.obsecure ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: widget.onvisibility, // Toggle visibility
        ),
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