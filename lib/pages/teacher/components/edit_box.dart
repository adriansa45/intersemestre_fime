import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class EditBox extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressedEdit;

  EditBox({super.key, required this.child, this.onPressedEdit});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(24),
          borderPadding: const EdgeInsets.all(10),
          dashPattern: const [
            10,
            6
          ], // Adjust this to change the size and separation of the dashes
          strokeWidth: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: child,
          ),
        ),
        GestureDetector(
          onTap: onPressedEdit,
          child: SizedBox(
            height: 40,
            width: 40,
            child: Container(
                alignment: Alignment.topRight,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.edit,
                    color: Color.fromRGBO(61, 61, 61, 1),
                  ),
                )),
          ),
        )
      ],
    );
  }
}
