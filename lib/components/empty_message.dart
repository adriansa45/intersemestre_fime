import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersemestral_fime/components/button_primary.dart';

class EmptyMessage extends StatelessWidget {
  EmptyMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("No hay opciones disponibles.",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(0, 89, 4, 1))),
        const SizedBox(height: 20),
        ButtonPrimary(
            text: "Regresar",
            active: false,
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    ));
  }
}
