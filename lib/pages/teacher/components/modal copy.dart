import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalSection extends StatelessWidget {
  final dynamic currentSection;
  final Widget body;
  final Widget footer;
  final VoidCallback? onPressedSave;

  const ModalSection(
      {super.key,
      required this.currentSection,
      required this.body,
      required this.footer,
      required this.onPressedSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(currentSection != null ? "Editar sección" : "Añadir sección",
          style: GoogleFonts.montserrat(
              color: Colors.black87, fontWeight: FontWeight.w600)),
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        child: body,
      ),
      actions: [
        GestureDetector(
          onTap: onPressedSave,
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
