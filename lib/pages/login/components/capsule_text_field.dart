import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CapsuleTextField extends StatefulWidget {
  final TextEditingController controller;

  CapsuleTextField({required this.controller});

  @override
  _CapsuleTextFieldState createState() => _CapsuleTextFieldState();
}

class _CapsuleTextFieldState extends State<CapsuleTextField> {
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
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        child: TextField(
          controller: widget.controller,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: 'Matrícula',
            hintStyle: GoogleFonts.montserrat(
              color: Colors.white.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
            icon: const Icon(
              Icons.person,
              size: 35,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
