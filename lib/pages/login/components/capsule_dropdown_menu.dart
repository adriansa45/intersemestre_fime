import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CapsuleDropdownMenu extends StatefulWidget {
  final ValueChanged<String?>? onChanged;

  CapsuleDropdownMenu({this.onChanged});

  @override
  _CapsuleDropdownMenuState createState() => _CapsuleDropdownMenuState();
}

class _CapsuleDropdownMenuState extends State<CapsuleDropdownMenu> {
  final List<String> list = ['Alumno', 'Docente'];
  String? dropdownValue = 'Alumno';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white.withOpacity(0.40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        child: DropdownButton<String>(
          dropdownColor: Colors.white.withOpacity(.5),
          value: dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(newValue);
            }
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          icon:
              const Icon(Icons.arrow_drop_down, size: 35, color: Colors.white),
          isExpanded: true,
          borderRadius: BorderRadius.circular(24),
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
