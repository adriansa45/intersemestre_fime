import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CapsulePasswordField extends StatefulWidget {
  final TextEditingController controller;

  CapsulePasswordField({required this.controller});

  @override
  _CapsulePasswordFieldState createState() => _CapsulePasswordFieldState();
}

class _CapsulePasswordFieldState extends State<CapsulePasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white.withOpacity(0.40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        child: TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: 'Ingrese contraseña',
            hintStyle: GoogleFonts.montserrat(
              color: Colors.white.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ),
              onPressed: _togglePasswordVisibility,
            ),
            icon: Icon(
              Icons.lock,
              size: 35,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
