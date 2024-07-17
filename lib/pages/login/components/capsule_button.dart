import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CapsuleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CapsuleButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
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
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                color: const Color.fromRGBO(0, 89, 4, 1),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
