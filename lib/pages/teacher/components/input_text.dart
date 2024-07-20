import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputText extends StatefulWidget {
  final String placeholder;
  final TextEditingController controller;

  InputText({required this.controller, required this.placeholder});

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    const Color textColor = Color.fromRGBO(46, 46, 46, 1);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color.fromRGBO(240, 240, 240, 1),
        boxShadow: [],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        child: TextField(
          maxLines: 1,
          controller: widget.controller,
          style: GoogleFonts.montserrat(
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: GoogleFonts.montserrat(
              color: textColor,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
            icon: const Icon(
              Icons.abc,
              size: 35,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
