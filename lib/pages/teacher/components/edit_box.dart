import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class EditBox extends StatelessWidget {
  final Widget child;

  EditBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DottedBorder(
          radius: const Radius.circular(24),
          borderPadding: EdgeInsets.all(10),
          child: child,
        ),
        Container(
            alignment: Alignment.topRight,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(214, 214, 214, 1),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: const Icon(
              Icons.edit,
              color: Color.fromRGBO(61, 61, 61, 1),
            ))
      ],
    );
  }
}
