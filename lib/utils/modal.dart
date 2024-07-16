import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  const Modal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
              children: [Text("Cerrar"), Text("Cerrar")],
            ),
          ),
        )
      ],
    );
  }
}
