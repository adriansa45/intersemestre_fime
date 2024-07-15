import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool active;
  double? fontSize = 18;

  ButtonPrimary(
      {super.key,
      required this.text,
      required this.active,
      required this.onPressed,
      this.fontSize});

  Color greenColor = const Color.fromRGBO(0, 89, 4, 1);
  List<BoxShadow> activeShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.25),
      spreadRadius: 2,
      blurRadius: 5,
      offset: Offset(0, 3), // changes position of shadow
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.12),
      spreadRadius: -10,
      blurRadius: 1,
    ),
  ];

  List<BoxShadow> deactiveShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.25),
      spreadRadius: 2,
      blurRadius: 5,
      offset: Offset(0, 3), // changes position of shadow
    )
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      width: 160,
      curve: Curves.fastLinearToSlowEaseIn,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: active ? greenColor : Colors.white,
            boxShadow: active ? activeShadow : deactiveShadow,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Center(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  color: active ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
