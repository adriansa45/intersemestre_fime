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
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
              color: Colors.black87, fontWeight: FontWeight.w600)),
      content: Container(
        width: double.maxFinite,
        height: 350,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        child: body,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Color.fromRGBO(214, 214, 214, 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Cancelar",
                          style: GoogleFonts.montserrat(
                            color: Color.fromRGBO(46, 46, 46, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          )),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: onPressedSave,
              child: Container(
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.green),
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
            ),
          ],
        )
      ],
    );
  }
}
