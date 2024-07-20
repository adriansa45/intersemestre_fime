import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalAction extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget footer;
  final VoidCallback? onClose;
  final bool? showClose;

  const ModalAction(
      {super.key,
      required this.title,
      required this.body,
      required this.footer,
      required this.onClose,
      this.showClose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title,
          style: GoogleFonts.montserrat(
              color: Colors.black87, fontWeight: FontWeight.w600)),
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        child: body,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            if (onClose != null) {
              onClose!();
            }
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24), color: Colors.green),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Aceptar",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
