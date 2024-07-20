import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentTopic extends StatelessWidget {
  final dynamic content;
  final bool addButton;
  final VoidCallback? onEditPressed;

  ContentTopic(
      {super.key,
      required this.content,
      this.onEditPressed,
      required this.addButton});

  @override
  Widget build(BuildContext context) {
    switch (content["type"]) {
      case 0:
        return Text(
          content["text"],
          textAlign: TextAlign.justify,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        );
      case 1:
        return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            child: Image.network(content["url"], fit: BoxFit.fitWidth));
      case 2:
        return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            child: Image.network(content["url"], fit: BoxFit.fitWidth));
      case 3:
        return Text(
          content["text"],
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: const Color.fromRGBO(0, 89, 4, 1)),
        );
    }
    return const SizedBox();
  }
}
