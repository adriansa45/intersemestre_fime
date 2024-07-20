import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputDropdown extends StatefulWidget {
  final List<String> list;
  final String value;
  final ValueChanged<String?>? onChanged;

  InputDropdown({this.onChanged, required this.list, required this.value});

  @override
  _InputDropdownState createState() => _InputDropdownState();
}

class _InputDropdownState extends State<InputDropdown> {
  List<String> list = [];
  String? dropdownValue = '';

  @override
  void initState() {
    super.initState();
    list = widget.list;
    dropdownValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    const Color textColor = Color.fromRGBO(46, 46, 46, 1);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color.fromRGBO(240, 240, 240, 1),
          boxShadow: []),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
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
          icon: const Icon(Icons.arrow_drop_down, size: 35, color: textColor),
          isExpanded: true,
          borderRadius: BorderRadius.circular(24),
          style: GoogleFonts.montserrat(
              color: textColor, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
