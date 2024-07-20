import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextarea extends StatefulWidget {
  final String placeholder;
  final TextEditingController controller;

  InputTextarea({required this.controller, required this.placeholder});

  @override
  _InputTextareaState createState() => _InputTextareaState();
}

class _InputTextareaState extends State<InputTextarea> {
  @override
  Widget build(BuildContext context) {
    const Color textColor = Color.fromRGBO(46, 46, 46, 1);
    return Flexible(
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color.fromRGBO(240, 240, 240, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
          child: TextField(
            minLines: 5,
            maxLines: 10,
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
            ),
          ),
        ),
      ),
    );
  }
}
