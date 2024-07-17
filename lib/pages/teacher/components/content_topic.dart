import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentTopic extends StatelessWidget {
  final dynamic content;

  ContentTopic({super.key, required this.content});

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
    }
    return const SizedBox();
  }
}
