import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController controller;

  SearchInput({required this.controller});

  @override
  _SearchInput createState() => _SearchInput();
}

class _SearchInput extends State<SearchInput> {
  final textColor = const Color.fromRGBO(87, 87, 87, 1);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        child: TextField(
          controller: widget.controller,
          style: GoogleFonts.montserrat(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            hintText: 'Buscar',
            hintStyle: GoogleFonts.montserrat(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            border: InputBorder.none,
            icon: Icon(
              Icons.search,
              size: 35,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
