import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Modal extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget footer;
  final bool? showClose;

  const Modal(
      {super.key,
      required this.title,
      required this.body,
      required this.footer,
      this.showClose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: GoogleFonts.montserrat(color: Colors.black87)),
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        child: Text("hola"),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24), color: Colors.green),
            child: Row(
              children: [Text("Cerrar")],
            ),
          ),
        )
      ],
    );
  }
}
